package org.giritechhub.service;

import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpSession;

import org.giritechhub.model.Course;
import org.giritechhub.model.Student;
import org.giritechhub.repository.CourseRepository;
import org.giritechhub.repository.StudentEnrollmentRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentCartService {

    private static final String CART_SESSION_KEY = "studentCart";


    @Autowired
    private CourseRepository courseRepository;


    @Autowired
    private StudentEnrollmentRepository studentEnrollmentRepository;


    @Autowired
    private StudentService studentService;


    // =========================================================
    // GET CART COURSE IDS
    // =========================================================

    @SuppressWarnings("unchecked")
    private List<Integer> getCartIds(HttpSession session) {

        Object cartObject =
                session.getAttribute(CART_SESSION_KEY);

        if (cartObject == null) {

            List<Integer> cart =
                    new ArrayList<>();

            session.setAttribute(
                    CART_SESSION_KEY,
                    cart
            );

            session.setAttribute(
                    "cartCount",
                    0
            );

            return cart;
        }

        return (List<Integer>) cartObject;
    }


    // =========================================================
    // GET CART COURSES
    // =========================================================

    public List<Course> getCartCourses(
            HttpSession session) {

        List<Integer> cartIds =
                getCartIds(session);

        List<Course> courses =
                new ArrayList<>();

        for (Integer courseId : cartIds) {

            Course course =
                    courseRepository.findById(
                            courseId
                    );

            if (course != null) {

                courses.add(course);
            }
        }

        return courses;
    }


    // =========================================================
    // ADD COURSE TO CART
    // =========================================================

    public boolean addToCart(
            HttpSession session,
            int courseId) {

        // -----------------------------------------------------
        // Check course exists
        // -----------------------------------------------------

        Course course =
                courseRepository.findById(
                        courseId
                );

        if (course == null) {

            return false;
        }


        // -----------------------------------------------------
        // Check logged-in student
        // -----------------------------------------------------

        Object userIdObject =
                session.getAttribute("userId");

        if (userIdObject == null) {

            return false;
        }

        int userId =
                (Integer) userIdObject;


        // -----------------------------------------------------
        // Get student
        // -----------------------------------------------------

        Student student =
                studentService.getStudentByUserId(
                        userId
                );

        if (student == null) {

            return false;
        }


        int studentId =
                student.getStudentId();


        // -----------------------------------------------------
        // Check whether already enrolled
        // -----------------------------------------------------

        if (studentEnrollmentRepository.isAlreadyEnrolled(
                studentId,
                courseId)) {

            return false;
        }


        // -----------------------------------------------------
        // Check available seats
        // -----------------------------------------------------

        int availableSeats =
                studentEnrollmentRepository
                        .getAvailableSeats(courseId);

        if (availableSeats <= 0) {

            return false;
        }


        // -----------------------------------------------------
        // Add to session cart
        // -----------------------------------------------------

        List<Integer> cartIds =
                getCartIds(session);


        // -----------------------------------------------------
        // Prevent duplicate course
        // -----------------------------------------------------

        if (!cartIds.contains(courseId)) {

            cartIds.add(courseId);

            updateCartCount(session);
        }


        return true;
    }


    // =========================================================
    // REMOVE COURSE FROM CART
    // =========================================================

    public boolean removeFromCart(
            HttpSession session,
            int courseId) {

        List<Integer> cartIds =
                getCartIds(session);

        boolean removed =
                cartIds.remove(
                        Integer.valueOf(courseId)
                );

        updateCartCount(session);

        return removed;
    }


    // =========================================================
    // CLEAR CART
    // =========================================================

    public void clearCart(
            HttpSession session) {

        session.removeAttribute(
                CART_SESSION_KEY
        );

        session.setAttribute(
                "cartCount",
                0
        );
    }


    // =========================================================
    // CART COUNT
    // =========================================================

    public int getCartCount(
            HttpSession session) {

        return getCartIds(session).size();
    }


    // =========================================================
    // UPDATE CART COUNT
    // =========================================================

    private void updateCartCount(
            HttpSession session) {

        session.setAttribute(
                "cartCount",
                getCartIds(session).size()
        );
    }


    // =========================================================
    // CHECK WHETHER COURSE IS IN CART
    // =========================================================

    public boolean isInCart(
            HttpSession session,
            int courseId) {

        return getCartIds(session)
                .contains(courseId);
    }


    // =========================================================
    // CALCULATE TOTAL FEE
    // =========================================================

    public double getCartTotal(
            HttpSession session) {

        double total = 0.0;

        List<Course> courses =
                getCartCourses(session);

        for (Course course : courses) {

            if (course.getFeeAmount() != null) {

                total +=
                        course.getFeeAmount()
                              .doubleValue();
            }
        }

        return total;
    }


    // =========================================================
    // REMOVE COURSE AFTER SUCCESSFUL ENROLLMENT
    // =========================================================

    public void removeCourseAfterEnrollment(
            HttpSession session,
            int courseId) {

        removeFromCart(
                session,
                courseId
        );
    }


    // =========================================================
    // REMOVE INVALID COURSES FROM CART
    //
    // Useful if course was deleted by Admin.
    // =========================================================

    public void cleanCart(
            HttpSession session) {

        List<Integer> cartIds =
                getCartIds(session);

        List<Integer> validIds =
                new ArrayList<>();

        for (Integer courseId : cartIds) {

            if (courseRepository.findById(courseId) != null) {

                validIds.add(courseId);
            }
        }

        session.setAttribute(
                CART_SESSION_KEY,
                validIds
        );

        session.setAttribute(
                "cartCount",
                validIds.size()
        );
    }


    // =========================================================
    // CHECK WHETHER COURSE CAN BE ENROLLED
    // =========================================================

    public boolean canEnroll(
            HttpSession session,
            int courseId) {

        Object userIdObject =
                session.getAttribute("userId");

        if (userIdObject == null) {

            return false;
        }

        int userId =
                (Integer) userIdObject;


        Student student =
                studentService.getStudentByUserId(
                        userId
                );

        if (student == null) {

            return false;
        }


        int studentId =
                student.getStudentId();


        // Already enrolled

        if (studentEnrollmentRepository.isAlreadyEnrolled(
                studentId,
                courseId)) {

            return false;
        }


        // Course must exist

        if (!studentEnrollmentRepository.courseExists(
                courseId)) {

            return false;
        }


        // Seats must be available

        return studentEnrollmentRepository
                .getAvailableSeats(courseId) > 0;
    }

}