--创建结点
CREATE (emp:Employee{id:125,name:"tom",sal:5000,deptno:10})
CREATE (emp:Employee{id:126,name:"jim",sal:4000,deptno:10})
CREATE (emp:Employee{id:127})

CREATE (l:location{id:101,add:"深圳福田",code:"7555"})

CREATE (emp:Employee{id:128,name:"Anne",sal:500000,deptno:10})
CREATE (emp:Employee{id:129,name:"Tnna",sal:3000,deptno:11})


CREATE (dept:Dept { deptno:11,dname:"开发",location:"深圳" }) return dept

MATCH (e:Employee) 
WHERE e.name IS NULL
RETURN e.id,e.name,e.sal,e.deptno

MATCH (emp:Employee),(dept:Dept) where emp.deptno=dept.deptno
CREATE (emp)-[r:work_in{entrydate:"01/05/2017"}]->(dept) 
RETURN r

MATCH(emp:Employee), (emp2:Employee) where emp2.id=128  and emp.id<>128
CREATE (emp)-[r:underline{}]->(emp2) 
RETURN r

MATCH (emp:Employee)-[r:work_in]->(dept:Dept) 
RETURN r

CREATE (emp)-[r:work_in]->(location) 

match(d:Dog{name:'tommy'}),(p:People{name:'Tome'}) create (d)-[:pet{type:'dog'}]->(p) return d,p


match(a)-[r:work_in]->(b) where id(a) in[63,64] delete a,b,r

CREATE (emp:Employee{name="Anne"})-[r:underline{}]->(emp2:Employee{name:"Tnna"}) 

match(boss:Employee{name:"Anne"})-[:underline]-(emp:Employee) return emp,boss

只能使用新的database
neo4j-admin import --mode csv --database=testdb2 --ignore-duplicate-nodes=true --ignore-missing-nodes=true  --input-encoding=UTF-8 --nodes:Dog C:\Users\liuqinghua\Desktop\neo4j-data\dogs.csv --nodes:Person=C:\Users\liuqinghua\Desktop\neo4j-data\person.csv --relationships:relation=C:\Users\liuqinghua\Desktop\neo4j-data\relation.csv
neo4j-admin import --mode csv --database=testdb2 --ignore-duplicate-nodes=true --ignore-missing-nodes=true --input-encoding=UTF-8 --nodes:Dog=C:\Users\liuqinghua\Desktop\neo4j-data\dogs.csv --nodes:Person=C:\Users\liuqinghua\Desktop\neo4j-data\person.csv
neo4j-admin import --mode csv --database=testdb2 --ignore-duplicate-nodes=true --ignore-missing-nodes=true --input-encoding=UTF-8 --nodes:Dog C:\Users\liuqinghua\Desktop\neo4j-data\dogs.csv --nodes:Person=C:\Users\liuqinghua\Desktop\neo4j-data\person.csv --relationships=C:\Users\liuqinghua\Desktop\neo4j-data\r-header.csv,C:\Users\liuqinghua\Desktop\neo4j-data\r.csv

--load,csv文件要放到neo4j_home\import目录下面
USING PERIODIC COMMIT 10   
LOAD CSV WITH HEADERS FROM "file:///dog3.csv" as d   
create (dog:Dog)
set dog=d

101,109,朋友
101,110,朋友
102,109,主人
102,110,朋友
103,108,朋友
