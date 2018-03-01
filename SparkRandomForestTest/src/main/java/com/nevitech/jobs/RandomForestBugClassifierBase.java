package com.nevitech.jobs;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import java.util.HashMap;

import org.apache.commons.io.FileUtils;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.mllib.tree.RandomForest;
import org.apache.spark.mllib.tree.model.RandomForestModel;
import org.apache.spark.mllib.util.MLUtils;


public class RandomForestBugClassifierBase {

    public static void main(String[] args) {

        // Configuring spark
        SparkConf sparkConf = new SparkConf().setAppName("RandomForestExample")
                .setMaster("local[*]")
                .set("spark.executor.memory","3g")
                .set("spark.driver.memory", "3g");

        // initializing the spark context
        JavaSparkContext jsc = new JavaSparkContext(sparkConf);


        // Load and parse the data file.
        String datapath = "./resources/trainingValues.txt";
        JavaRDD trainingData;
        try {
            trainingData = MLUtils.loadLibSVMFile(jsc.sc(), datapath).toJavaRDD();
        } catch (Exception e1) {
            System.out.println("No training data available.");
            e1.printStackTrace();
            return;
        }
        /*JavaRDD trainingDataString = trainingData.map(s -> Integer.parseInt(s) + 1);

        for (Object o : trainingDataString.collect())
            System.out.println("MSS--->" + o.toString());
        */
        // Configuration/Hyper parameters to train random forest model
        Integer numClasses = 200;
        // Empty categoricalFeaturesInfo indicates all features are continuous.
        HashMap<Integer, Integer> categoricalFeaturesInfo =new HashMap<Integer, Integer>(){{
            //put(0,2);    // feature 0 is considered discrete, with values from 0 to 9
            put(1,20);  // feature 1 is considered discrete, with values from 0 to 6
            //put(2,10);  // feature 2 is considered discrete, with values from 0 to 9
            // feature 3 is considered continuous valued
            //put(4,10);  // feature 4 is considered discrete, with values from 0 to 9
            // feature 5 is considered continuous valued
        }};
        Integer numTrees = 9; // number of decision trees to be included in the Random Forest
        String featureSubsetStrategy = "auto"; // Let the algorithm choose, which set of features to be made as subsets
        String impurity = "gini";    // adds impurity to the experiments/samples in the training data : gini is a choice
        Integer maxDepth = 30;    // maximum depth of a decision tree that can grow
        Integer maxBins = 20;    // classifier first splits the training data into number of bins, and this parameter decides the maximum number of bins
        Integer seed = 12345;    // classifier introduces some randomization, and for this randomization to be same across iterations, same seed is used in all the iterations inside classifier

        // training the classifier with all the hyper-parameters defined above
        final RandomForestModel model = RandomForest.trainClassifier(trainingData, numClasses,
                categoricalFeaturesInfo, numTrees, featureSubsetStrategy, impurity, maxDepth, maxBins,
                seed);

        System.out.print("");
        // Delete if model already present, and Save the new model
        try {
            FileUtils.forceDelete(new File("RandForestClsfrMdl"));
            System.out.println("\nDeleting old model completed.");
        } catch (FileNotFoundException e1) {
        } catch (IOException e) {
        }
        // saving the random forest model that is generated
        model.save(jsc.sc(), "RandForestClsfrMdl"+File.separator+"model");
        System.out.println("\nRandForestClsfrMdl/model has been created and successfully saved.");

        // printing the random forest model (collection of decision trees)
        System.out.println(model.toDebugString());

        jsc.stop();

    }
}