package cn.asens.controller;

import cn.asens.entity.Performance;
import cn.asens.mng.PerformanceMng;
import cn.asens.util.FluxPageImpl;
import cn.asens.util.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.reactive.function.server.ServerRequest;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import javax.annotation.Resource;
import java.util.*;

@Controller
public class PerformanceAct {
    private static Logger log= LogManager.getLogger(PerformanceAct.class);
    @Resource
    private PerformanceMng performanceMng;

    @RequestMapping("/performance/list")
    public String performance(Integer pageNo, Integer httpCode, String start,
                              String end, Integer overTime, Integer order,
                              String urlName,
                              Model model, ServerHttpRequest request) {
        int pageSize = 10;
        if (pageNo == null) pageNo = 1;
        pageNo--;
        FluxPageImpl<Performance> page=performanceMng.getPage(overTime, PageRequest.of(pageNo,pageSize));
        model.addAttribute("httpCodeList", performanceMng.distinctHttpCodeList());
        model.addAttribute("list", page.getFlux());
        model.addAttribute("count", page.getCount());
        model.addAttribute("pageable", PageRequest.of(pageNo+1,pageSize));
        model.addAttribute("fluxPageImpl", page);
        if(httpCode!=null){
            model.addAttribute("httpCode", httpCode);
        }

        if(StringUtils.isNotBlank(start)) model.addAttribute("start", start);
        if(StringUtils.isNotBlank(end)) model.addAttribute("end", end);
        if(overTime!=null){
            model.addAttribute("overTime", overTime);
        }
        if(order!=null){
            model.addAttribute("order", order);
        }
        if(StringUtils.isNotBlank(urlName)){
            model.addAttribute("urlName", urlName);
        }


        return "performance/list";
    }

//    @RequestMapping("/performance/day")
//    public String day(Integer day,String start,String end,ModelMap model) {
//        if(day==null){
//            day=0;
//        }
//        performanceMng.count(day,start,end,model);
//        return "performance/day";
//    }

//    @RequestMapping("/performance/performanceInfo")
//    public String performanceInfo(String id,ModelMap model) {
//        Mono<Performance> performance=performanceMng.findById(id);
//        String errorLog=performance.getErrorLog();
//        if(StringUtils.isNotBlank(errorLog)){
//            model.put("errorLog",errorLog);
//            parseErrorLog(errorLog,model);
//        }
//
//        String queryMessages=performance.getQueryMessages();
//        if(StringUtils.isNotBlank(queryMessages)){
//            model.put("queryMessages",queryMessages);
//            parseQueryMessages(queryMessages,model);
//        }
//
//        return "performance/performanceInfo";
//    }



    private void parseQueryMessages(String queryMessages, ModelMap model) {
        List<String> queryMessageList=
                new ArrayList<>(Arrays.asList(queryMessages.split(";")));
        Map<String,Integer> countMap=new LinkedHashMap<>();
        Map<String,Integer> timeMap=new LinkedHashMap<>();
        for(String query:queryMessageList){
            if(StringUtils.isBlank(query)||!query.contains("##")){
                continue;
            }
            try {
                String[] arr = query.split("##");
                String queries = arr[0];
                Integer time = Integer.valueOf(arr[1]);
                int count = 1;
                if (queries.contains("*")) {
                    count = Integer.valueOf(queries.split("\\*")[1]);
                    queries = queries.split("\\*")[0];
                }
                timeMap.put(queries, time);
                countMap.put(queries, count);
            }catch (Exception e){
                log.error("query is invalid :"+query);
                throw new IllegalArgumentException("query is invalid :"+query);
            }
        }
        model.put("countMap",countMap);
        model.put("timeMap",timeMap);
    }

    private void parseErrorLog(String errorLog, ModelMap model) {
        String[] arr=errorLog.split("##");
        String message=arr[0];
        String cause=arr[1];
        String stackMessage=arr[2];
        List<String> stackMessageList=
                new ArrayList<>(Arrays.asList(stackMessage.split(";")));
        model.put("message",message);
        model.put("cause",cause);
        model.put("stackMessageList",stackMessageList);
    }


}
