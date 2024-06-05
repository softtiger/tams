package com.nytkm.tams.common;

import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
/*
 * @author     chengYu
 * @date     2020/9/2
 * @describe  分页工具
 */

@ApiModel("分页信息")
public class Pagination<T> implements Serializable {

    public static final int DEFAULT_PAGESIZE = 10;
    @ApiModelProperty("页号")
    private int pageNo = 1;

    @ApiModelProperty("页尺寸")
    private int pageSize = DEFAULT_PAGESIZE;

    @ApiModelProperty("总记录数")
    private long totalCount;


    @ApiModelProperty("总页数")
    private int totalPages;// 总页数

    private List<T> elements;

    
    
    
    private Pagination() {
    }

    private Pagination(int page) {
        this.pageNo = page;
    }

    private Pagination(int page, int size) {
        this.pageNo = page;
        this.pageSize = size;
    }

    
    
    public static <T> Pagination<T> getPagination(int pageNo,int pageSize,long totalCount,List<T> pageData ){
		Pagination<T> pagination = new Pagination<T>(pageNo, pageSize);
		pagination.setTotalCount(totalCount);
		pagination.setElements(pageData);
        pagination.totalPages =  (int)(totalCount + pageSize -1 )/ pageSize;
		return pagination;
	}
    
    
    /**
     * 页码. 当前第几页.
     *
     * @return 页码
     */
    public int getPageNo() {
        return pageNo;
    }

    /**
     * 设置当前页码.
     *
     * @param pageNo 页码
     */
    public void setPageNo(int pageNo) {
        if (pageNo > 1) {
            this.pageNo = pageNo;
        }
    }

    /**
     * 分页大小. 一页包含多少数据.
     *
     * @return 分页大小
     */
    public int getPageSize() {
        return pageSize;
    }

    /**
     * 设置分页大小.
     *
     * @param pageSize 一页包含多少数据
     */
    public void setPageSize(int pageSize) {
        if (pageSize > 1) {
            this.pageSize = pageSize;
        }
    }

    /**
     * 获取不分页时的总数据量.
     *
     * @return 总数据量
     */
    public long getTotalCount() {
        return totalCount;
    }

    /**
     * 设置不分页时的总数据量.
     *
     * @param totalCount 总数据量
     */
    public void setTotalCount(long totalCount) {
        this.totalCount = totalCount;
    }

    /**
     * 获取分页时的总页数.
     *
     * @return 总页数
     */
    public int getTotalPages() {
        return (int)(totalCount + pageSize -1 )/ pageSize;
    }

    /**
     * 当前页是否超出总页数范围.
     *
     * @return true - 已超出页码范围. false - 未超出范围.
     */
    @JsonIgnore
    public boolean isOverflowed() {
        return getIndex() >= totalCount;
    }

    /**
     * 获取当前数据索引.
     *
     * @return 索引
     */
    @JsonIgnore
    public int getIndex() {
        return (pageNo - 1) * pageSize;
    }

    /**
     * 获取当前页数据列表.
     *
     * @return 当前页数据列表
     */
    public List<T> getElements() {
        return elements;
    }

    /**
     * 设置当前页数据列表.
     *
     * @param elements 当前页数据列表
     */
    public void setElements(List<T> elements) {
        this.elements = elements;
    }

    public String toJson() {
        return "{\"page\":" + pageNo + ",\"size\":" + pageSize + ",\"total\":" + totalCount + "}";
    }

    /**
     * {@inheritDoc }. 与{@link #toJson() }等价
     *
     * @return JSON字符串
     */
    @Override
    public String toString() {
        return toJson();
    }
    
    /**
     * 将对象的属性填充入map中
     * @param map
     */
    public void  genReturnInfo(Map<String,Object> map) {
    	map.put("pageNo", getPageNo());
    	map.put("totalPages",getTotalPages());
    	map.put("pageSize", getPageSize());
    	map.put("totalCount", getTotalCount());
    	map.put("items", elements);
    }
}
