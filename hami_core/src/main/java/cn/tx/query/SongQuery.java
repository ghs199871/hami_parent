package cn.tx.query;

import cn.tx.model.Song;

public class SongQuery extends Song {

    private Integer pageSize = 5;

    private Integer pageNo;

    private Integer startNum;

    private String srname;

    private String aname;

    private String tname;

    private Integer pageNoProtal = 1;

    public Integer getPageNoProtal() {
        return pageNoProtal;
    }

    public void setPageNoProtal(Integer pageNoProtal) {
        this.pageNoProtal = pageNoProtal;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public Integer getStartNum() {
        return startNum;
    }

    public void setStartNum(Integer startNum) {
        this.startNum = startNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public String getSrname() {
        return srname;
    }

    public void setSrname(String srname) {
        this.srname = srname;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }
}
