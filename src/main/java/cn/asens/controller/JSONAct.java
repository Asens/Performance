package cn.asens.controller;

import cn.asens.entity.Performance;
import cn.asens.mng.PerformanceMng;
import cn.asens.util.StringUtils;
import com.alibaba.fastjson.JSON;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;
import reactor.core.publisher.Mono;

import javax.annotation.Resource;
import java.io.IOException;

/**
 * @author Asens
 * create 2018-05-06 22:06
 **/
@Controller
public class JSONAct {
    private static Logger log= LogManager.getLogger(JSONAct.class);

    @Resource
    private PerformanceMng performanceMng;

    @RequestMapping("/performance")
    @ResponseBody
    public String performance(@RequestBody String json)
            throws IOException {
        if (StringUtils.isBlank(json)) {
            return "fail : param is empty";
        }

        try {
            log.info(json);
            Performance performance = JSON.parseObject(json, Performance.class);
            performanceMng.save(performance).subscribe();

            return "success";
        }catch (Exception e){
            return "fail : message "+e.getMessage();
        }
    }
}
