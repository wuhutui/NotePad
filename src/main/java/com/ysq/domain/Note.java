package com.ysq.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;
public class Note {
    private int nid;
    private int uid;
    private String nevent;
    private int nlevel;
    private int nday;
    private double nhour;

    public int getNid() {
        return nid;
    }

    public void setNid(int nid) {
        this.nid = nid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getNevent() {
        return nevent;
    }

    public void setNevent(String nevent) {
        this.nevent = nevent;
    }

    public int getNlevel() {
        return nlevel;
    }

    public void setNlevel(int nlevel) {
        this.nlevel = nlevel;
    }

    public int getNday() {
        return nday;
    }

    public void setNday(int nday) {
        this.nday = nday;
    }

    public double getNhour() {
        return nhour;
    }

    public void setNhour(double nhour) {
        this.nhour = nhour;
    }

    @Override
    public String toString() {
        return "Note{" +
                "nid=" + nid +
                ", uid=" + uid +
                ", nevent='" + nevent + '\'' +
                ", nlevel=" + nlevel +
                ", nday=" + nday +
                ", nhour=" + nhour +
                '}';
    }
}

