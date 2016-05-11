package com.demo.util;

import com.jfinal.plugin.activerecord.Page;

public class EasyuiUtil {
    public static EasyuiPage adapterEasyuiPage(Page page){
        EasyuiPage ep = new EasyuiPage();
        ep.setRows(page.getList());
        ep.setPage(page.getPageNumber());
        ep.setTotal(page.getTotalRow());
        return ep;
    }
}
