package org.homeworktracker.casestudy.database.dao;

import org.homeworktracker.casestudy.database.entity.Assignment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface AssignmentDAO extends JpaRepository<Assignment,Long> {
    List<Assignment> findByStudentId(Integer studentId);
    Assignment findById(Integer id);

    // Native query to sort by course dueDate and status
    @Query(value = "SELECT * FROM Assignments a where a.student_id = :studentId ORDER BY a.course", nativeQuery = true)
    List<Assignment> findByStudentIdOrderByDueCourseAsc(Integer studentId);

    @Query(value = "SELECT * FROM Assignments a where a.student_id = :studentId ORDER BY a.course DESC", nativeQuery = true)
    List<Assignment> findByStudentIdOrderByDueCourseDesc(Integer studentId);

    @Query(value = "SELECT * FROM Assignments a WHERE a.student_id = :studentId ORDER BY a.due_date", nativeQuery = true)
    List<Assignment> findByStudentIdOrderByDueDateAsc(Integer studentId);

    @Query(value = "SELECT * FROM Assignments a WHERE a.student_id = :studentId ORDER BY a.due_date DESC", nativeQuery = true)
    List<Assignment> findByStudentIdOrderByDueDateDesc(Integer studentId);

    @Query(value = "SELECT * FROM Assignments a WHERE a.student_id = :studentId ORDER BY a.status", nativeQuery = true)
    List<Assignment> findByStudentIdOrderByStatus(Integer studentId);

    @Query(value = "SELECT * FROM Assignments a WHERE a.student_id = :studentId ORDER BY a.status DESC" , nativeQuery = true)
    List<Assignment> findByStudentIdOrderByStatusDesc(Integer studentId);

    List<Assignment> findByStudentIdAndCreatedDateBetween(Integer studentId, Date startDate, Date endDate);
}


