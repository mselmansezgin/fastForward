package com.nevitech.jobs;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.execution.vectorized.ColumnarBatch;
import scala.Tuple2;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.mllib.regression.LabeledPoint;
import org.apache.spark.mllib.tree.RandomForest;
import org.apache.spark.mllib.tree.model.RandomForestModel;
import org.apache.spark.mllib.util.MLUtils;
// $example off$

public class RandomForestBugClassifier {
    public static void main(String[] args) {
        // Configuring spark
        SparkConf sparkConf = new SparkConf().setAppName("RandomForestBugClassifier")
                .setMaster("local[*]")
                .set("spark.executor.memory","3g")
                .set("spark.driver.memory", "3g");
        JavaSparkContext jsc = new JavaSparkContext(sparkConf);
        // Load and parse the data file.
        String datapath = "./resources/fastForward_libsvm_file.txt";
        JavaRDD<LabeledPoint> data = MLUtils.loadLibSVMFile(jsc.sc(), datapath).toJavaRDD();


        // Split the data into training and test sets (30% held out for testing)
        JavaRDD<LabeledPoint>[] splits = data.randomSplit(new double[]{0.7, 0.3});
        JavaRDD<LabeledPoint> trainingData = splits[0];
        JavaRDD<LabeledPoint> testData = splits[1];

        // Train a RandomForest model.
        // Empty categoricalFeaturesInfo indicates all features are continuous.
        Integer numClasses = 205;
        Map<Integer, Integer> categoricalFeaturesInfo = new HashMap<>();
        categoricalFeaturesInfo.put(0,4);
        categoricalFeaturesInfo.put(1,23);
        categoricalFeaturesInfo.put(2,6);
        categoricalFeaturesInfo.put(3,14);
        categoricalFeaturesInfo.put(4,6);
        categoricalFeaturesInfo.put(5,59);
        categoricalFeaturesInfo.put(6,3);
        categoricalFeaturesInfo.put(7,2);
        categoricalFeaturesInfo.put(8,2);
        categoricalFeaturesInfo.put(9,2);
        categoricalFeaturesInfo.put(10,2);
        categoricalFeaturesInfo.put(11,2);
        categoricalFeaturesInfo.put(12,2);
        categoricalFeaturesInfo.put(13,2);
        categoricalFeaturesInfo.put(14,2);
        categoricalFeaturesInfo.put(15,2);
        Integer numTrees = 50; // Use more in practice.
        String featureSubsetStrategy = "auto"; // Let the algorithm choose.
        String impurity = "gini";
        Integer maxDepth = 30;
        Integer maxBins = 59;
        Integer seed = 12345;



        RandomForestModel model = RandomForest.trainClassifier(trainingData, numClasses,
                categoricalFeaturesInfo, numTrees, featureSubsetStrategy, impurity, maxDepth, maxBins,
                seed);

        // Evaluate model on test instances and compute test error
        JavaPairRDD<Double, Double> predictionAndLabel =
                testData.mapToPair(p -> new Tuple2<>(model.predict(p.features()), p.label()));
        double testErr =
                predictionAndLabel.filter(pl -> !pl._1().equals(pl._2())).count() / (double) testData.count();

        //System.out.println("Learned classification forest model:\n" + model.toDebugString());


        System.out.println("Test Error: " + testErr);

        // Delete if model already present, and Save the new model
        try {
            FileUtils.forceDelete(new File("target/tmp/myRandomForestClassificationModel"));
            System.out.println("\nDeleting old model completed.");
        } catch (FileNotFoundException e1) {
        } catch (IOException e) {
        }

        // Save and load model
        model.save(jsc.sc(), "target/tmp/myRandomForestClassificationModel");
        RandomForestModel sameModel = RandomForestModel.load(jsc.sc(),
                "target/tmp/myRandomForestClassificationModel");
        // $example off$
        //while(true);
        //jsc.stop();
    }
}