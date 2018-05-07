package cn.asens.mng.impl;

import cn.asens.dao.PerformanceDao;
import cn.asens.entity.Performance;
import cn.asens.mng.PerformanceMng;
import cn.asens.util.FluxPageImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import javax.annotation.Resource;


/**
 * @author Asens
 * create 2018-05-06 10:44
 **/
@Service
public class PerformanceMngImpl implements PerformanceMng {

    @Resource
    private PerformanceDao performanceDao;


    @Override
    public Mono<Performance> save(Performance performance) {
        return performanceDao.save(performance);
    }

    @Override
    public Flux<Performance> getList() {
        return performanceDao.findAll();
    }

    @Override
    public Mono<Performance> findById(String id) {
        return performanceDao.findById(id);
    }

    @Override
    public Flux<Performance> findByName(String name) {
        return performanceDao.findByName(name);
    }

    @Override
    public Flux<Performance> findByName(String name, Pageable pageable) {
        return null;
    }

    @Override
    public Flux<Performance> useTimeMoreThan(Integer useTime) {
        return performanceDao.useTimeMoreThan(useTime);
    }

    @Override
    public FluxPageImpl<Performance> getPage(Integer overTime, Pageable pageable) {
        Flux<Performance> flux=performanceDao.getPage(overTime,pageable);
        Mono<Long> count=performanceDao.count(overTime);
        return new FluxPageImpl<>(flux,pageable,count);
    }

    @Override
    public Flux<Integer> distinctHttpCodeList() {
        return performanceDao.distinctHttpCodeList();
    }
}
