package org.giritechhub.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.giritechhub.model.Department;
import org.giritechhub.service.DepartmentService;
import org.giritechhub.service.ReportService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletResponse;

@Controller
public class ReportController {

    private final ReportService reportService;
    private final DepartmentService departmentService;

    public ReportController(
            ReportService reportService,
            DepartmentService departmentService) {

        this.reportService = reportService;
        this.departmentService = departmentService;
    }


    // =========================================================
    // REPORT PAGE
    // =========================================================

    @GetMapping("/admin/reports")
    public String reports(
            @RequestParam(value = "type", required = false)
            String type,

            @RequestParam(value = "deptId", required = false)
            Integer deptId,

            @RequestParam(value = "semester", required = false)
            Integer semester,

            @RequestParam(value = "status", required = false)
            String status,

            @RequestParam(value = "dateFrom", required = false)
            String dateFromString,

            @RequestParam(value = "dateTo", required = false)
            String dateToString,

            Model model) {

        if (type == null || type.isBlank()) {
            type = "students";
        }

        LocalDate dateFrom = parseDate(dateFromString);
        LocalDate dateTo = parseDate(dateToString);


        List<Department> departments =
                departmentService.getAllDepartments();

        model.addAttribute("departments", departments);

        model.addAttribute("reportType", type);
        model.addAttribute("selectedDeptId", deptId);
        model.addAttribute("selectedSemester", semester);
        model.addAttribute("selectedStatus", status);
        model.addAttribute("dateFrom", dateFromString);
        model.addAttribute("dateTo", dateToString);


        // =====================================================
        // STUDENT REPORT
        // =====================================================

        List<Map<String, Object>> students =
                reportService.getStudentReport(
                        deptId,
                        semester,
                        dateFrom,
                        dateTo
                );

        model.addAttribute("students", students);

        model.addAttribute(
                "totalStudents",
                reportService.getTotalStudents(
                        deptId,
                        semester
                )
        );


        // =====================================================
        // COURSE REPORT
        // =====================================================

        List<Map<String, Object>> courses =
                reportService.getCourseReport(
                        deptId,
                        semester
                );

        model.addAttribute("courses", courses);

        model.addAttribute(
                "totalCourses",
                reportService.getTotalCourses(deptId)
        );

        model.addAttribute(
                "fullCourses",
                reportService.getFullCourses(deptId)
        );


        // =====================================================
        // ENROLLMENT REPORT
        // =====================================================

        List<Map<String, Object>> enrollments =
                reportService.getEnrollmentReport(
                        deptId,
                        semester,
                        status,
                        dateFrom,
                        dateTo
                );

        model.addAttribute("enrollments", enrollments);

        model.addAttribute(
                "totalEnrollments",
                reportService.getTotalEnrollments(
                        deptId,
                        semester,
                        status,
                        dateFrom,
                        dateTo
                )
        );

        model.addAttribute(
                "enrolledCount",
                reportService.getEnrolledCount(
                        deptId,
                        semester,
                        dateFrom,
                        dateTo
                )
        );

        model.addAttribute(
                "droppedCount",
                reportService.getDroppedCount(
                        deptId,
                        semester,
                        dateFrom,
                        dateTo
                )
        );

        model.addAttribute(
                "completedCount",
                reportService.getCompletedCount(
                        deptId,
                        semester,
                        dateFrom,
                        dateTo
                )
        );


        // =====================================================
        // PAYMENT REPORT
        // =====================================================

        List<Map<String, Object>> payments =
                reportService.getPaymentReport(
                        semester,
                        status,
                        dateFrom,
                        dateTo
                );

        model.addAttribute("payments", payments);

        model.addAttribute(
                "paymentRevenue",
                reportService.getPaymentRevenue(
                        semester,
                        status,
                        dateFrom,
                        dateTo
                )
        );

        model.addAttribute(
                "paidCount",
                reportService.getPaidCount(
                        semester,
                        dateFrom,
                        dateTo
                )
        );

        model.addAttribute(
                "pendingCount",
                reportService.getPendingCount(
                        semester,
                        dateFrom,
                        dateTo
                )
        );

        model.addAttribute(
                "failedCount",
                reportService.getFailedCount(
                        semester,
                        dateFrom,
                        dateTo
                )
        );


        return "admin/reports";
    }


    // =========================================================
    // CSV EXPORT
    // =========================================================

    @GetMapping("/admin/reports/export")
    public void exportReport(
            @RequestParam(value = "type", required = false)
            String type,

            @RequestParam(value = "deptId", required = false)
            Integer deptId,

            @RequestParam(value = "semester", required = false)
            Integer semester,

            @RequestParam(value = "status", required = false)
            String status,

            @RequestParam(value = "dateFrom", required = false)
            String dateFromString,

            @RequestParam(value = "dateTo", required = false)
            String dateToString,

            HttpServletResponse response)
            throws IOException {

        if (type == null || type.isBlank()) {
            type = "students";
        }

        LocalDate dateFrom = parseDate(dateFromString);
        LocalDate dateTo = parseDate(dateToString);


        List<Map<String, Object>> data;


        if ("courses".equalsIgnoreCase(type)) {

            data = reportService.getCourseReport(
                    deptId,
                    semester
            );

        } else if ("enrollments".equalsIgnoreCase(type)) {

            data = reportService.getEnrollmentReport(
                    deptId,
                    semester,
                    status,
                    dateFrom,
                    dateTo
            );

        } else if ("payments".equalsIgnoreCase(type)) {

            data = reportService.getPaymentReport(
                    semester,
                    status,
                    dateFrom,
                    dateTo
            );

        } else {

            data = reportService.getStudentReport(
                    deptId,
                    semester,
                    dateFrom,
                    dateTo
            );

        }


        response.setContentType("text/csv");

        response.setCharacterEncoding("UTF-8");

        response.setHeader(
                HttpHeaders.CONTENT_DISPOSITION,
                "attachment; filename=\"" +
                type.toLowerCase() +
                "-report.csv\""
        );


        PrintWriter writer =
                response.getWriter();


        if (data.isEmpty()) {

            writer.println("No records found");

            writer.flush();

            return;
        }


        // Headers
        Map<String, Object> firstRow =
                data.get(0);

        writer.println(
                firstRow.keySet()
                        .stream()
                        .map(this::escapeCsv)
                        .reduce(
                                (a, b) -> a + "," + b
                        )
                        .orElse("")
        );


        // Data
        for (Map<String, Object> row : data) {

            StringBuilder line =
                    new StringBuilder();

            boolean first = true;

            for (Object value : row.values()) {

                if (!first) {
                    line.append(",");
                }

                line.append(
                        escapeCsv(
                                value == null
                                        ? ""
                                        : value.toString()
                        )
                );

                first = false;
            }

            writer.println(line);
        }


        writer.flush();
    }


    // =========================================================
    // DATE PARSER
    // =========================================================

    private LocalDate parseDate(String value) {

        if (value == null || value.isBlank()) {
            return null;
        }

        try {

            return LocalDate.parse(value);

        } catch (Exception e) {

            return null;
        }
    }


    // =========================================================
    // CSV ESCAPE
    // =========================================================

    private String escapeCsv(String value) {

        if (value == null) {
            return "";
        }

        String escaped =
                value.replace("\"", "\"\"");

        if (escaped.contains(",")
                || escaped.contains("\"")
                || escaped.contains("\n")
                || escaped.contains("\r")) {

            return "\"" + escaped + "\"";
        }

        return escaped;
    }
}