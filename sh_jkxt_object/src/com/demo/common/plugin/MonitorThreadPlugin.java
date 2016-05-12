package com.demo.common.plugin;

import com.demo.service.MonitorThread;
import com.jfinal.plugin.IPlugin;

public class MonitorThreadPlugin implements IPlugin {

    @Override
    public boolean start() {
        Thread t = new MonitorThread();
        t.setDaemon(true);
        t.start();
        System.out.println("监听线程启动。");
        return true;
    }

    @Override
    public boolean stop() {
        return true;
    }

}
