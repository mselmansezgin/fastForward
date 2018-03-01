
--YapÝlan Üßlemler SÝrasÝyla
1-Datasetin ham hali tabloya alÝndÝ.
2-Word countlar hesaplandÝ
3-En fazla geen 100 tane kelime tespit edildi.
4-En fazla sayÝda gemese de šnemli olabilecek kelimeler usable olarak ißaretlendi.
5-Word indexe gšre ilgili bugÝn iinde geip gememe durumu kontrol edildi.

5-Categoric kolonlar idler ile temsil edilecekler.


select * from public.dataset


CREATE SCHEMA mss_playground;

use mss_playground;

create sequence product_seq	

select *
  from mss_playground.raw_dataset ;
	
select * from mss_playground.raw_word_counts
order by word_count desc;


select * from (
	select wc.*,row_number() OVER (ORDER BY word_id) as rownum
	  from mss_playground.raw_word_counts wc
	 where usable = 'Y'
	 ) a;
	 
	 
select * from mss_playground.raw_word_counts_wrownum
	 
create table mss_playground.raw_word_counts_wrownum as 
select wc.*,row_number() OVER (ORDER BY word_id) as rownum
	  from mss_playground.raw_word_counts wc
	 where usable = 'Y'

	 select * from (
select is_word_exists(1,rd.bug_id) as w1,
	   is_word_exists(2,rd.bug_id) as w2,
	   is_word_exists(3,rd.bug_id) as w3,
	   is_word_exists(4,rd.bug_id) as w4,
	   is_word_exists(5,rd.bug_id) as w5,
	   is_word_exists(6,rd.bug_id) as w6,
	   is_word_exists(7,rd.bug_id) as w7,
	   is_word_exists(8,rd.bug_id) as w8,
	   is_word_exists(9,rd.bug_id) as w9,
	   is_word_exists(10,rd.bug_id) as w10,
	   is_word_exists(11,rd.bug_id) as w11,
	   is_word_exists(12,rd.bug_id) as w12,
	   is_word_exists(13,rd.bug_id) as w13,
	   is_word_exists(14,rd.bug_id) as w14,
	   is_word_exists(15,rd.bug_id) as w15,
	   is_word_exists(16,rd.bug_id) as w16,
	   is_word_exists(17,rd.bug_id) as w17,
	   is_word_exists(18,rd.bug_id) as w18,
	   is_word_exists(19,rd.bug_id) as w19,
	   is_word_exists(20,rd.bug_id) as w20, rd.* from mss_playground.raw_dataset rd
) aa

insert into mss_playground.categories(cat_type,cat_desc)
select 'PRODUCT',product from (select distinct product from mss_playground.raw_dataset rd) a

insert into mss_playground.categories(cat_type,cat_desc)
select 'COMPONENT',component from (select distinct component from mss_playground.raw_dataset rd) a

insert into mss_playground.categories(cat_type,cat_desc)
select 'DEVELOPER',assignee from (select distinct assignee from mss_playground.raw_dataset rd) a

insert into mss_playground.categories(cat_type,cat_desc)
select 'RESOLUTION',resolution from (select distinct resolution from mss_playground.raw_dataset rd) a

insert into mss_playground.categories(cat_type,cat_desc)
select 'FLAGS',flags from (select distinct flags from mss_playground.raw_dataset rd) a

insert into mss_playground.categories(cat_type,cat_desc)
select 'HARDWARE',hardware from (select distinct hardware from mss_playground.raw_dataset rd) a

insert into mss_playground.categories(cat_type,cat_desc)
select 'KEYWORD',keywords from (select distinct keywords from mss_playground.raw_dataset rd) a

insert into mss_playground.categories(cat_type,cat_desc)
select 'OS',os from (select distinct os from mss_playground.raw_dataset rd) a

insert into mss_playground.categories(cat_type,cat_desc)
select 'PRIORITY',priority from (select distinct priority from mss_playground.raw_dataset rd) a

insert into mss_playground.categories(cat_type,cat_desc)
select 'REPORTER',reporter from (select distinct reporter from mss_playground.raw_dataset rd) a

select * from mss_playground.feature_set_extended
limit 50;

select * from mss_playground.raw_dataset

select * from mss_playground.feature_set_extended
order by cast(bug_id as integer);

select class_assignee,
	   product_cat,
	   component_cat,
	   resolution_cat,
	   flag_cat,
	   hardware_cat,
	   keywords_cat,
	   priority_cat,
	   w1,w2,w3,w4,w5,w6,w8,w9,w10
  from mss_playground.feature_set_extended
  limit 50;
  
  drop table mss_playground.feature_set_extended;
  
  
  
  
  select class_assignee,
	   product_cat,
	   component_cat,
	   resolution_cat,
	   flag_cat,
	   hardware_cat,
	   keywords_cat,
	   priority_cat,
	   w1,w2,w3,w4,w5,w6,w7,w8,w9,w10
	   w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,
	   w21,w22,w23,w24,w25,w26,w27,w28,w29,w30,
	   w31,w32,w33,w34,w35,w36,w37,w38,w39,w40
  from mss_playground.feature_set_extended
  
  
  select * from mss_playground.categories
where cat_type = 'DEVELOPER'

1,4
2,23
3,6
4,14
5,6
6,59
7,3
8,2
9,2
10,2
11,2
12,2
13,2
14,2
15,2
16,2

create table mss_playground.feature_set_extended as 
select rd.bug_id,c3.cat_id as class_assignee,
	   c1.cat_id as product_cat,
	   c2.cat_id as component_cat,
	   c4.cat_id as resolution_cat,
	   c5.cat_id as flag_cat,
	   c6.cat_id as hardware_cat,
	   c7.cat_id as keywords_cat,
	   c8.cat_id as os_cat,
	   c9.cat_id as priority_cat,
	   c10.cat_id as reporter_cat,
	   is_word_exists(1,rd.bug_id) as w1,
	   is_word_exists(2,rd.bug_id) as w2,
	   is_word_exists(3,rd.bug_id) as w3,
	   is_word_exists(4,rd.bug_id) as w4,
	   is_word_exists(5,rd.bug_id) as w5,
	   is_word_exists(6,rd.bug_id) as w6,
	   is_word_exists(7,rd.bug_id) as w7,
	   is_word_exists(8,rd.bug_id) as w8,
	   is_word_exists(9,rd.bug_id) as w9,
	   is_word_exists(10,rd.bug_id) as w10,
	   is_word_exists(11,rd.bug_id) as w11,
	   is_word_exists(12,rd.bug_id) as w12,
	   is_word_exists(13,rd.bug_id) as w13,
	   is_word_exists(14,rd.bug_id) as w14,
	   is_word_exists(15,rd.bug_id) as w15,
	   is_word_exists(16,rd.bug_id) as w16,
	   is_word_exists(17,rd.bug_id) as w17,
	   is_word_exists(18,rd.bug_id) as w18,
	   is_word_exists(19,rd.bug_id) as w19,
	   is_word_exists(20,rd.bug_id) as w20,
	   is_word_exists(21,rd.bug_id) as w21,
	   is_word_exists(22,rd.bug_id) as w22,
	   is_word_exists(23,rd.bug_id) as w23,
	   is_word_exists(24,rd.bug_id) as w24,
	   is_word_exists(25,rd.bug_id) as w25,
	   is_word_exists(26,rd.bug_id) as w26,
	   is_word_exists(27,rd.bug_id) as w27,
	   is_word_exists(28,rd.bug_id) as w28,
	   is_word_exists(29,rd.bug_id) as w29,
	   is_word_exists(30,rd.bug_id) as w30,
	   is_word_exists(31,rd.bug_id) as w31,
	   is_word_exists(32,rd.bug_id) as w32,
	   is_word_exists(33,rd.bug_id) as w33,
	   is_word_exists(34,rd.bug_id) as w34,
	   is_word_exists(35,rd.bug_id) as w35,
	   is_word_exists(36,rd.bug_id) as w36,
	   is_word_exists(37,rd.bug_id) as w37,
	   is_word_exists(38,rd.bug_id) as w38,
	   is_word_exists(39,rd.bug_id) as w39,
	   is_word_exists(40,rd.bug_id) as w40,
	   is_word_exists(41,rd.bug_id) as w41,
	   is_word_exists(42,rd.bug_id) as w42,
	   is_word_exists(43,rd.bug_id) as w43,
	   is_word_exists(44,rd.bug_id) as w44,
	   is_word_exists(45,rd.bug_id) as w45,
	   is_word_exists(46,rd.bug_id) as w46,
	   is_word_exists(47,rd.bug_id) as w47,
	   is_word_exists(48,rd.bug_id) as w48,
	   is_word_exists(49,rd.bug_id) as w49,
	   is_word_exists(50,rd.bug_id) as w50,
	   is_word_exists(51,rd.bug_id) as w51,
	   is_word_exists(52,rd.bug_id) as w52,
	   is_word_exists(53,rd.bug_id) as w53,
	   is_word_exists(54,rd.bug_id) as w54,
	   is_word_exists(55,rd.bug_id) as w55,
	   is_word_exists(56,rd.bug_id) as w56,
	   is_word_exists(57,rd.bug_id) as w57,
	   is_word_exists(58,rd.bug_id) as w58,
	   is_word_exists(59,rd.bug_id) as w59,
	   is_word_exists(60,rd.bug_id) as w60,
	   is_word_exists(61,rd.bug_id) as w61,
	   is_word_exists(62,rd.bug_id) as w62,
	   is_word_exists(63,rd.bug_id) as w63,
	   is_word_exists(64,rd.bug_id) as w64,
	   is_word_exists(65,rd.bug_id) as w65,
	   is_word_exists(66,rd.bug_id) as w66,
	   is_word_exists(67,rd.bug_id) as w67,
	   is_word_exists(68,rd.bug_id) as w68,
	   is_word_exists(69,rd.bug_id) as w69,
	   is_word_exists(70,rd.bug_id) as w70,
	   is_word_exists(71,rd.bug_id) as w71,
	   is_word_exists(72,rd.bug_id) as w72,
	   is_word_exists(73,rd.bug_id) as w73,
	   is_word_exists(74,rd.bug_id) as w74,
	   is_word_exists(75,rd.bug_id) as w75,
	   is_word_exists(76,rd.bug_id) as w76,
	   is_word_exists(77,rd.bug_id) as w77,
	   is_word_exists(78,rd.bug_id) as w78,
	   is_word_exists(79,rd.bug_id) as w79,
	   is_word_exists(80,rd.bug_id) as w80,
	   is_word_exists(81,rd.bug_id) as w81,
	   is_word_exists(82,rd.bug_id) as w82,
	   is_word_exists(83,rd.bug_id) as w83,
	   is_word_exists(84,rd.bug_id) as w84,
	   is_word_exists(85,rd.bug_id) as w85,
	   is_word_exists(86,rd.bug_id) as w86,
	   is_word_exists(87,rd.bug_id) as w87,
	   is_word_exists(88,rd.bug_id) as w88,
	   is_word_exists(89,rd.bug_id) as w89,
	   is_word_exists(90,rd.bug_id) as w90,
	   is_word_exists(91,rd.bug_id) as w91,
	   is_word_exists(92,rd.bug_id) as w92,
	   is_word_exists(93,rd.bug_id) as w93,
	   is_word_exists(94,rd.bug_id) as w94,
	   is_word_exists(95,rd.bug_id) as w95,
	   is_word_exists(96,rd.bug_id) as w96,
	   is_word_exists(97,rd.bug_id) as w97,
	   is_word_exists(98,rd.bug_id) as w98,
	   is_word_exists(99,rd.bug_id) as w99,
	   is_word_exists(100,rd.bug_id) as w100,
	   is_word_exists(101,rd.bug_id) as w101,
	   is_word_exists(102,rd.bug_id) as w102,
	   is_word_exists(103,rd.bug_id) as w103,
	   is_word_exists(104,rd.bug_id) as w104
  from mss_playground.raw_dataset rd,
       mss_playground.categories c1,mss_playground.categories c2,
       mss_playground.categories c3,mss_playground.categories c4,
       mss_playground.categories c5,mss_playground.categories c6,
       mss_playground.categories c7,mss_playground.categories c8,
       mss_playground.categories c9,mss_playground.categories c10
 where (c1.cat_desc = rd.product and c1.cat_type = 'PRODUCT')
   and (c2.cat_desc = rd.component and c2.cat_type = 'COMPONENT')
   and (c3.cat_desc = rd.assignee and c3.cat_type = 'DEVELOPER')
   and (c4.cat_desc = rd.resolution and c4.cat_type = 'RESOLUTION')
   and (c5.cat_desc = rd.flags and c5.cat_type = 'FLAGS')
   and (c6.cat_desc = rd.hardware and c6.cat_type = 'HARDWARE')
   and (c7.cat_desc = rd.keywords and c7.cat_type = 'KEYWORD')
   and (c8.cat_desc = rd.os and c8.cat_type = 'OS')
   and (c9.cat_desc = rd.priority and c9.cat_type = 'PRIORITY')
   and (c10.cat_desc = rd.reporter and c10.cat_type = 'REPORTER')



select * from mss_playground.categories
where cat_type = 'REPORTER'

update mss_playground.categories
set cat_id = cat_id - 1
where cat_type = 'REPORTER'



drop FUNCTION is_word_exists(integer,text)

CREATE INDEX idx_row_id_raw_word_counts_wrownum ON mss_playground.raw_word_counts_wrownum (rownum);

CREATE INDEX idx_summary_raw_word_counts_wrownum ON mss_playground.raw_word_counts_wrownum (rownum);

CREATE or replace FUNCTION is_word_exists(index_num integer,bug_id text)
RETURNS integer AS 
$BODY$
DECLARE the_word text;
declare is_exists integer;
BEGIN
        
        the_word = get_word($1);
         
        select count(*) into is_exists
          from mss_playground.raw_dataset rd
         where rd.bug_id = $2
           and rd.summary like '%'||the_word||'%';

           if is_exists > 0 then
           	return 1;
           else
           	return 0;
           end if;
END;
$BODY$
LANGUAGE plpgsql;


CREATE or replace FUNCTION get_word(index_num integer)
RETURNS text AS 
$BODY$
DECLARE the_word text;
BEGIN
        SELECT word INTO the_word
          from mss_playground.raw_word_counts_wrownum rwc
         WHERE rwc.rownum = $1;
         
         return the_word;         
END;
$BODY$
LANGUAGE plpgsql;

user_id 

select distinct * from mss_playground.raw_word_counts
where usable = 'Y'
order by word_count desc


update mss_playground.raw_word_counts
set usable = 'N'
where word_count < 94


	
update mss_playground.raw_word_counts
set usable = 'Y'
where word in (
'NLS',
'Breakpoints',
'[WorkbenchParts]',
'JDI',
'CCE',
'IllegalArgumentException',
'JDK',
'[CommonNavigator]',
'ConcurrentModificationException',
'[QuickAccess]',
'JAR',
'Mac',
'[Wizards]',
'[formatter]',
'[Perspectives]',
'[patch]',
'[1.7]',
'[performance]',
'AssertionFailedException',
'ArrayIndexOutOfBoundsException',
'[Encoding]',
'NPEs',
'[preferences]',
'[refactoring]')





	
	

	
	
	
	
	
	
CREATE TABLE mss_playground.categories (
cat_id int2 NOT NULL DEFAULT nextval('word_seq'::regclass),	
cat_type varchar(20),
cat_desc varchar(250)	
) ;


	

	
	
	
	
	
	
	
	


CREATE TABLE mss_playground.raw_dataset (
	bug_id varchar(4000),
	product varchar(4000),
	component varchar(4000),
	Assignee varchar(4000),
	Status varchar(4000),
	Resolution varchar(4000),
	Summary varchar(4000),
	Changed varchar(4000),
	Assignee_Real_Name varchar(4000),
	Classification varchar(4000),
	Flags varchar(4000),
	Hardware varchar(4000),
	Keywords varchar(4000),
	Number_of_Comments varchar(4000),
	Opened_date varchar(4000),
	OS varchar(4000),
	Priority varchar(4000),
	QA_Contact varchar(4000),
	QA_Contact_Real_Name varchar(4000),
	Reporter varchar(4000),
	Reporter_Real_Name varchar(4000),
	Severity varchar(4000),
	Summary_Tags varchar(4000),
	Target_Milestone varchar(4000),
	URL varchar(4000),
	Version_info varchar(4000),
	Votes varchar(4000),
	Whiteboard varchar(4000),
	Alias varchar(4000)
) ;
