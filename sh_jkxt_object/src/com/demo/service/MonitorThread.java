package com.demo.service;

import java.util.List;
import java.util.Random;

import com.demo.common.model.MonitorLog;
import com.demo.common.model.MonitorObjectConfig;

public class MonitorThread extends Thread {
    private static final long sleepTime = 2000l;

    @Override
    public void run() {
        while (true) {
            try {
                addLog();
                Thread.sleep(sleepTime);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

    }

    private void addLog() {
        List<MonitorObjectConfig> list = MonitorObjectConfig.dao.findAll();
        for (MonitorObjectConfig moc : list) {
            MonitorLog log = new MonitorLog();
            log.setObjectId(moc.getId());

            if (1 != moc.getAppStatus()) {
                log.setAccessCount(0);
            } else {
                log.setAccessCount(generateAccessCount(moc.getAccessCountMin(), moc.getAccessCountMax()));
            }
            log.setAppName(moc.getAppName());
            log.setAppStatus(moc.getAppStatus());
            log.save();
        }
    }

    public static int generateAccessCount(int min, int max) {
        return new Random().nextInt(max - min + 1) + min;
    }

}
