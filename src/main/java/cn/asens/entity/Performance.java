package cn.asens.entity;

import java.util.Date;


public class Performance {
    private String id;
    private Date viewDate;
    private Integer viewYear;
    private Integer viewMonth;
    private Integer viewDay;
    private Integer useTime;
    private String url;
    private Integer httpCode;
    private String errorLog;
    private String queryMessages;
    private Integer queryCount;
    private Integer maxQueryTime;
    private String urlName;
    private String parsedURL;
    private Integer appId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getUseTime() {
        return useTime;
    }

    public void setUseTime(Integer useTime) {
        this.useTime = useTime;
    }

    public Integer getAppId() {
        return appId;
    }

    public void setAppId(Integer appId) {
        this.appId = appId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getHttpCode() {
        return httpCode;
    }

    public void setHttpCode(Integer httpCode) {
        this.httpCode = httpCode;
    }

    public String getErrorLog() {
        return errorLog;
    }

    public void setErrorLog(String errorLog) {
        this.errorLog = errorLog;
    }

    public String getQueryMessages() {
        return queryMessages;
    }

    public void setQueryMessages(String queryMessages) {
        this.queryMessages = queryMessages;
    }

    public Integer getQueryCount() {
        return queryCount;
    }

    public void setQueryCount(Integer queryCount) {
        this.queryCount = queryCount;
    }

    public Integer getMaxQueryTime() {
        return maxQueryTime;
    }

    public void setMaxQueryTime(Integer maxQueryTime) {
        this.maxQueryTime = maxQueryTime;
    }

    public String getUrlName() {
        return urlName;
    }

    public void setUrlName(String urlName) {
        this.urlName = urlName;
    }

    public Date getViewDate() {
        return viewDate;
    }

    public void setViewDate(Date viewDate) {
        this.viewDate = viewDate;
    }

    public Integer getViewYear() {
        return viewYear;
    }

    public void setViewYear(Integer viewYear) {
        this.viewYear = viewYear;
    }

    public Integer getViewMonth() {
        return viewMonth;
    }

    public void setViewMonth(Integer viewMonth) {
        this.viewMonth = viewMonth;
    }

    public Integer getViewDay() {
        return viewDay;
    }

    public void setViewDay(Integer viewDay) {
        this.viewDay = viewDay;
    }

    public String getParsedURL() {
        return parsedURL;
    }

    public void setParsedURL(String parsedURL) {
        this.parsedURL = parsedURL;
    }
}
