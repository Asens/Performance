package cn.asens.util;

import cn.asens.entity.Performance;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.util.Iterator;
import java.util.List;
import java.util.function.Function;

/**
 * @author Asens
 * create 2018-05-07 1:38
 **/

public class FluxPageImpl<T>{
    private final Flux<T> flux;
    private final Pageable pageable;
    private final Mono<Long> count;

    public FluxPageImpl(Flux<T> flux, Pageable pageable, Mono<Long> count) {
        this.flux=flux;
        this.pageable=pageable;
        this.count=count;
    }

    public Flux<T> getFlux() {
        return flux;
    }

    public Pageable getPageable() {
        return pageable;
    }

    public Mono<Long> getCount() {
        return count;
    }

    public Integer totalCount(int count,int pageSize){
        if(count%pageSize==0){
            return count/pageSize;
        }

        return count/pageSize+1;
    }
}
