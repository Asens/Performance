package cn.asens.controller;

import cn.asens.entity.Performance;
import cn.asens.mng.PerformanceMng;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.jupiter.api.Test;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @author Asens
 * create 2018-05-05 22:37
 **/
@Controller
class TestAct {
    private static Logger log= LogManager.getLogger(TestAct.class);

    @Resource
    private PerformanceMng performanceMng;

    @RequestMapping(value="/",method = RequestMethod.GET)
    String index(String asd, ServerHttpRequest request, Model model){
        model.addAttribute("aa","bb");
        return "index";
    }

    @RequestMapping(value="/list")
    public String list(ServerHttpRequest request, Model model){
        log.info("list");
        model.addAttribute("list",performanceMng.getList());
        return "list";
    }

    @RequestMapping(value="/find/{id}")
    public String find(@PathVariable String id, ServerHttpRequest request, Model model){
        log.info("find "+id);
        Mono<Performance> performanceMono=performanceMng.findById(id);
        performanceMono.subscribe(p->log.info(p.toString()));
        model.addAttribute("list",performanceMng.getList());
        return "list";
    }

    @RequestMapping(value="/useTimeMoreThan/{useTime}")
    public String useTimeMoreThan(@PathVariable Integer useTime, ServerHttpRequest request, Model model){
        log.info("useTimeMoreThan "+useTime);
        Flux<Performance> performanceMono=performanceMng.useTimeMoreThan(useTime);
        //performanceMono.subscribe(p->log.info(p.toString()));
        model.addAttribute("list",performanceMono);
        return "list";
    }

    @RequestMapping(value="/findByName/{name}")
    public String findByName(@PathVariable String name, ServerHttpRequest request, Model model){
        log.info("find "+name);
        Flux<Performance> performanceList=performanceMng.findByName(name,PageRequest.of(0,10));
        //performanceMono.subscribe(p->log.info(p.toString()));
        model.addAttribute("list",performanceList);
        return "list";
    }


    @RequestMapping("/save")
    @ResponseBody
    public Mono<String> save(){
        String name="update";
        Performance performance=new Performance();
        performance.setUrlName(name);
        performance.setViewDate(new Date());
        performance.setUseTime((int)(Math.random()*3000)+100);
        performanceMng.save(performance).subscribe();
        return Mono.just("success");
    }


    @Test
    void mm(){

    }

}
