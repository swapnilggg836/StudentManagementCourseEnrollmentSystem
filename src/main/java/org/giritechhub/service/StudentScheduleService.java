package org.giritechhub.service;

import java.util.List;

import org.giritechhub.model.StudentSchedule;
import org.giritechhub.repository.StudentScheduleRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentScheduleService {

    @Autowired
    private StudentScheduleRepository studentScheduleRepository;


    // =========================================================
    // GET STUDENT SCHEDULE
    // =========================================================

    public List<StudentSchedule> getStudentSchedule(int studentId) {

        if (studentId <= 0) {
            throw new IllegalArgumentException(
                    "Invalid student."
            );
        }

        return studentScheduleRepository.findByStudentId(
                studentId
        );
    }
}