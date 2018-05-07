package cn.asens.mng;

import cn.asens.entity.Performance;
import cn.asens.util.FluxPageImpl;
import javafx.scene.control.Pagination;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;


import java.util.List;

public interface PerformanceMng {

    Mono<Performance> save(Performance performance);

    Flux<Performance> getList();

    Mono<Performance> findById(String id);

    Flux<Performance> findByName(String name);

    Flux<Performance> findByName(String name,Pageable pageable);

    Flux<Performance> useTimeMoreThan(Integer useTime);

    FluxPageImpl<Performance> getPage(Integer overTime, Pageable pageable);

    Flux<Integer> distinctHttpCodeList();

}
