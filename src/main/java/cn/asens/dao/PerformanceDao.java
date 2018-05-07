package cn.asens.dao;

import cn.asens.entity.Performance;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.mongodb.repository.ReactiveMongoRepository;
import org.springframework.stereotype.Repository;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@Repository
public interface PerformanceDao extends ReactiveMongoRepository<Performance, String>,SelfPerformanceDao {


}
