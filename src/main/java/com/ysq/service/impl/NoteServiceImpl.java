package com.ysq.service.impl;

import com.ysq.dao.NoteDao;
import com.ysq.domain.Note;
import com.ysq.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class NoteServiceImpl implements NoteService {
    @Autowired
    private NoteDao noteDao;


    public boolean savenote(Note note) {
        noteDao.savenote(note);
        return true;
    }


    public boolean updatenote(Note note) {
        noteDao.updatenote(note);
        return true;
    }


    public boolean deletnote(int nid) {
        noteDao.deletnote(nid);
        return true;
    }


    public Note getbyId(int nid) {
        return noteDao.getbyId(nid);
    }


    public List<Note> getbylevel(int uid, int nlevel) {
        return noteDao.getbylevel(uid, nlevel);
    }


    public List<Note> getAll(int uid) {
        return noteDao.getAll(uid);
    }

    public List<Integer> getidbyId(int uid) {
        return noteDao.getidbyId(uid);
    }
}
