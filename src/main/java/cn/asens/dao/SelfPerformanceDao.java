package cn.asens.dao;

import cn.asens.entity.Performance;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

public interface SelfPerformanceDao {
    Flux<Performance> findByName(String name);

    Flux<Performance> useTimeMoreThan(Integer useTime);

    Flux<Performance> getPage(Integer overTime, Pageable pageable);

    Flux<Integer> distinctHttpCodeList();

    Mono<Long> count(Integer overTime);
}
