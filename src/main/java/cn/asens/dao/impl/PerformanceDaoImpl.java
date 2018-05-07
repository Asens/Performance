package cn.asens.dao.impl;

import cn.asens.dao.PerformanceDao;
import cn.asens.dao.SelfPerformanceDao;
import cn.asens.entity.Performance;
import com.sun.nio.zipfs.ZipInfo;
import com.sun.org.apache.xpath.internal.objects.XObject;
import org.bson.Document;
import org.reactivestreams.Publisher;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.ReactiveMongoOperations;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.mongodb.core.aggregation.TypedAggregation;
import org.springframework.data.mongodb.core.mapreduce.GroupBy;
import org.springframework.data.mongodb.core.mapreduce.GroupByResults;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.CriteriaDefinition;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import javax.annotation.Resource;

import java.util.Date;
import java.util.List;

import static org.springframework.data.domain.Sort.Direction.ASC;
import static org.springframework.data.domain.Sort.Direction.DESC;
import static org.springframework.data.mongodb.core.aggregation.Aggregation.*;
import static org.springframework.data.mongodb.core.query.Criteria.where;

/**
 * @author Asens
 * create 2018-05-06 11:46
 **/
@Repository
public class PerformanceDaoImpl implements SelfPerformanceDao {
    @Resource
    private ReactiveMongoOperations mongoOperations;

    @Override
    public Flux<Performance> findByName(String name) {
        return mongoOperations.find(new Query(this.getNameCriteria(name)),Performance.class);
    }

    @Override
    public Flux<Performance> useTimeMoreThan(Integer useTime) {

        TypedAggregation<Performance> agg= newAggregation(Performance.class,
                match(where("date").lt(new Date())),
                group("name").sum("useTime").as("count"),
                sort(ASC,"count")
        );
        mongoOperations.aggregate(agg, Document.class)
                .subscribe(performance->{
                    System.out.println(performance.toString());
                },e->{
                    System.out.println("error");
                    e.printStackTrace();
                });


        return mongoOperations.find(new Query(where("useTime").gt(useTime)),Performance.class);
    }

    @Override
    public Flux<Performance> getPage(Integer overTime, Pageable pageable) {
        Query query=new Query().limit(pageable.getPageSize()).skip(pageable.getOffset());
        if(overTime!=null)
            query.addCriteria(where("useTime").gt(overTime));
        return mongoOperations.find(query,Performance.class);
    }

    @Override
    public Flux<Integer> distinctHttpCodeList() {
        TypedAggregation<Performance> agg= newAggregation(Performance.class,
                group("httpCode")
        );
        return  mongoOperations.aggregate(agg, Document.class)
                .map(document -> document.getInteger(previousOperation()));
    }

    @Override
    public Mono<Long> count(Integer overTime) {
        Query query=new Query();
        if(overTime!=null)
            query.addCriteria(where("useTime").gt(overTime));
        return mongoOperations.count(query,Performance.class);
    }


    private CriteriaDefinition getNameCriteria(String name) {
        return where("name").is(name);
    }
}
