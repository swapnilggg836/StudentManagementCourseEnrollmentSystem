/* =========================================================
   EDUMANAGE - GLOBAL JAVASCRIPT

   ADMIN DASHBOARD
========================================================= */


document.addEventListener("DOMContentLoaded", function () {


    /* =====================================================
       1. SIDEBAR TOGGLE
    ====================================================== */

    const sidebarToggle =
        document.getElementById("sidebarToggle");

    const adminSidebar =
        document.getElementById("adminSidebar");


    if (sidebarToggle && adminSidebar) {

        sidebarToggle.addEventListener("click", function () {

            adminSidebar.classList.toggle(
                "mobile-open"
            );

        });

    }



    /* =====================================================
       2. PROFILE DROPDOWN
    ====================================================== */

    const profileDropdownBtn =
        document.getElementById(
            "profileDropdownBtn"
        );

    const profileDropdown =
        document.getElementById(
            "profileDropdown"
        );


    if (profileDropdownBtn && profileDropdown) {

        profileDropdownBtn.addEventListener(
            "click",
            function (event) {

                event.stopPropagation();

                profileDropdown.classList.toggle(
                    "show"
                );

            }
        );


        document.addEventListener(
            "click",
            function () {

                profileDropdown.classList.remove(
                    "show"
                );

            }
        );

    }



    /* =====================================================
       3. ACTIVE SIDEBAR LINK
    ====================================================== */

    const sidebarLinks =
        document.querySelectorAll(
            ".sidebar-link"
        );

    const currentPath =
        window.location.pathname;


    sidebarLinks.forEach(function (link) {

        const href =
            link.getAttribute("href");


        if (!href || href === "#") {

            return;

        }


        if (currentPath.includes(href)) {

            link.classList.add("active");

        }

    });



    /* =====================================================
       4. GLOBAL SEARCH
    ====================================================== */

    const globalSearch =
        document.getElementById(
            "globalSearch"
        );


    if (globalSearch) {

        globalSearch.addEventListener(
            "input",
            function () {

                const searchValue =
                    this.value
                        .trim()
                        .toLowerCase();


                console.log(
                    "Global search:",
                    searchValue
                );


                /*
                 * Backend API can be connected later.
                 *
                 * Example:
                 *
                 * GET /api/admin/search?query=...
                 */

            }
        );

    }



    /* =====================================================
       5. NOTIFICATION BUTTON
    ====================================================== */

    const notificationBtn =
        document.getElementById(
            "notificationBtn"
        );


    if (notificationBtn) {

        notificationBtn.addEventListener(
            "click",
            function () {

                console.log(
                    "Notifications clicked"
                );


                /*
                 * Backend API can be connected later.
                 *
                 * Example:
                 *
                 * GET /api/admin/notifications
                 */

            }
        );

    }



    /* =====================================================
       6. LOAD CHART.JS
    ====================================================== */

    loadChartLibrary();

});



/* =========================================================
   LOAD CHART.JS
========================================================= */

function loadChartLibrary() {

    /*
     * Check whether Chart.js already exists.
     */

    if (typeof Chart !== "undefined") {

        initializeDashboardCharts();

        return;

    }


    /*
     * Load Chart.js dynamically.
     */

    const chartScript =
        document.createElement("script");


    chartScript.src =
        "https://cdn.jsdelivr.net/npm/chart.js@4.4.7/dist/chart.umd.min.js";


    chartScript.onload = function () {

        initializeDashboardCharts();

    };


    chartScript.onerror = function () {

        console.error(
            "Unable to load Chart.js"
        );

    };


    document.head.appendChild(
        chartScript
    );

}



/* =========================================================
   DASHBOARD CHARTS
========================================================= */

function initializeDashboardCharts() {

    initializeEnrollmentChart();

    initializeDepartmentChart();

}



/* =========================================================
   7. STUDENT ENROLLMENT TREND
========================================================= */

function initializeEnrollmentChart() {

    const canvas =
        document.getElementById(
            "enrollmentTrendChart"
        );


    if (!canvas) {

        return;

    }


    /*
     * Prevent duplicate chart initialization.
     */

    if (canvas.chartInstance) {

        canvas.chartInstance.destroy();

    }


    /*
     * =====================================================
     * GET BACKEND DATA
     * =====================================================
     *
     * dashboard.jsp creates:
     *
     * window.enrollmentTrendData
     *
     *
     * Example:
     *
     * [
     *     {
     *         month: "2026-01",
     *         totalEnrollments: 5
     *     },
     *
     *     {
     *         month: "2026-02",
     *         totalEnrollments: 8
     *     }
     * ]
     */

    const trendData =
        Array.isArray(
            window.enrollmentTrendData
        )
            ? window.enrollmentTrendData
            : [];


    /*
     * Convert backend months into chart labels.
     *
     * 2026-01 → Jan
     * 2026-02 → Feb
     */

    const labels =
        trendData.map(
            function (item) {

                return formatMonth(
                    item.month
                );

            }
        );


    /*
     * Get enrollment numbers.
     */

    const values =
        trendData.map(
            function (item) {

                return Number(
                    item.totalEnrollments
                );

            }
        );


    /*
     * Create Enrollment Trend Chart.
     *
     * If database has no records,
     * an empty chart is displayed.
     *
     * No fake data is used.
     */

    canvas.chartInstance =
        new Chart(
            canvas,
            {

                type: "line",


                data: {

                    labels: labels,


                    datasets: [

                        {

                            label:
                                "Student Enrollments",


                            data: values,


                            borderColor:
                                "#146ef5",


                            backgroundColor:
                                "rgba(20, 110, 245, 0.08)",


                            borderWidth: 2,


                            fill: true,


                            tension: 0.4,


                            pointRadius: 3,


                            pointHoverRadius: 5

                        }

                    ]

                },


                options: {

                    responsive: true,


                    maintainAspectRatio: false,


                    plugins: {

                        legend: {

                            display: false

                        },


                        tooltip: {

                            backgroundColor:
                                "#111827",


                            padding: 10,


                            titleFont: {

                                size: 11

                            },


                            bodyFont: {

                                size: 11

                            }

                        }

                    },


                    scales: {

                        x: {

                            grid: {

                                display: false

                            },


                            ticks: {

                                color:
                                    "#94a3b8",


                                font: {

                                    size: 9

                                }

                            }

                        },


                        y: {

                            beginAtZero: true,


                            grid: {

                                color:
                                    "#edf1f5"

                            },


                            ticks: {

                                color:
                                    "#94a3b8",


                                font: {

                                    size: 9

                                },


                                precision: 0

                            }

                        }

                    }

                }

            }

        );

}



/* =========================================================
   FORMAT MONTH
========================================================= */

function formatMonth(monthValue) {

    if (!monthValue) {

        return "";

    }


    /*
     * Expected backend format:
     *
     * YYYY-MM
     *
     * Example:
     *
     * 2026-09
     */

    const parts =
        monthValue.split("-");


    if (parts.length !== 2) {

        return monthValue;

    }


    const year =
        Number(parts[0]);


    const month =
        Number(parts[1]);


    if (
        !year ||
        !month ||
        month < 1 ||
        month > 12
    ) {

        return monthValue;

    }


    const date =
        new Date(
            year,
            month - 1,
            1
        );


    return date.toLocaleString(
        "en-US",
        {
            month: "short"
        }
    );

}



/* =========================================================
   8. DEPARTMENT SHARE
========================================================= */

function initializeDepartmentChart() {

    const canvas =
        document.getElementById(
            "departmentShareChart"
        );


    if (!canvas) {

        return;

    }


    /*
     * Prevent duplicate chart initialization.
     */

    if (canvas.chartInstance) {

        canvas.chartInstance.destroy();

    }


    /*
     * =====================================================
     * GET DEPARTMENT DATA FROM BACKEND
     * =====================================================
     *
     * dashboard.jsp creates:
     *
     * window.departmentShareData
     *
     *
     * Example:
     *
     * [
     *     {
     *         code: "CSE",
     *         name: "Computer Science",
     *         studentCount: 120
     *     },
     *
     *     {
     *         code: "IT",
     *         name: "Information Technology",
     *         studentCount: 95
     *     }
     * ]
     */

    const departmentData =
        Array.isArray(
            window.departmentShareData
        )
            ? window.departmentShareData
            : [];


    /*
     * Department codes
     */

    const labels =
        departmentData.map(
            function (item) {

                return item.code;

            }
        );


    /*
     * Student counts
     */

    const values =
        departmentData.map(
            function (item) {

                return Number(
                    item.studentCount
                );

            }
        );


    /*
     * =====================================================
     * CHART COLORS
     * =====================================================
     *
     * These colors match the existing dashboard UI.
     */

    const chartColors = [

        "#146ef5",

        "#168b5b",

        "#f4b400",

        "#ef5365",

        "#8057e8",

        "#06a6c7",

        "#e67e22",

        "#16a085",

        "#8e44ad",

        "#34495e"

    ];


    /*
     * Use only as many colors as departments.
     */

    const colors =
        values.map(
            function (_, index) {

                return chartColors[
                    index % chartColors.length
                ];

            }
        );


    /*
     * =====================================================
     * CREATE DEPARTMENT DOUGHNUT CHART
     * =====================================================
     */

    canvas.chartInstance =
        new Chart(
            canvas,
            {

                type: "doughnut",


                data: {

                    labels: labels,


                    datasets: [

                        {

                            data: values,


                            backgroundColor:
                                colors,


                            borderWidth: 0

                        }

                    ]

                },


                options: {

                    responsive: true,


                    maintainAspectRatio: false,


                    cutout: "68%",


                    plugins: {

                        /*
                         * Legend is already displayed
                         * separately in dashboard.jsp.
                         */

                        legend: {

                            display: false

                        },


                        /*
                         * =================================================
                         * TOOLTIP
                         * =================================================
                         *
                         * Example:
                         *
                         * CSE: 120 students (32.8%)
                         */

                        tooltip: {

                            backgroundColor:
                                "#111827",


                            padding: 10,


                            callbacks: {

                                label:
                                    function (context) {

                                        const total =
                                            context.dataset.data
                                                .reduce(
                                                    function (
                                                        sum,
                                                        value
                                                    ) {

                                                        return (
                                                            sum +
                                                            Number(value)
                                                        );

                                                    },
                                                    0
                                                );


                                        const value =
                                            Number(
                                                context.parsed
                                            );


                                        const percentage =
                                            total > 0
                                                ? (
                                                    value /
                                                    total
                                                ) * 100
                                                : 0;


                                        return (

                                            " " +

                                            context.label +

                                            ": " +

                                            value +

                                            " students (" +

                                            percentage.toFixed(1) +

                                            "%)"

                                        );

                                    }

                            }

                        }

                    }

                }

            }

        );

}



/* =========================================================
   9. CLOSE SIDEBAR WHEN CLICKING OUTSIDE - MOBILE
========================================================= */

document.addEventListener(
    "click",
    function (event) {

        const sidebar =
            document.getElementById(
                "adminSidebar"
            );


        const toggle =
            document.getElementById(
                "sidebarToggle"
            );


        if (!sidebar || !toggle) {

            return;

        }


        /*
         * Only apply outside-click behavior
         * on mobile.
         */

        if (window.innerWidth > 768) {

            return;

        }


        if (

            sidebar.classList.contains(
                "mobile-open"
            )

            &&

            !sidebar.contains(
                event.target
            )

            &&

            !toggle.contains(
                event.target
            )

        ) {

            sidebar.classList.remove(
                "mobile-open"
            );

        }

    }
);



/* =========================================================
   10. HANDLE WINDOW RESIZE
========================================================= */

window.addEventListener(
    "resize",
    function () {

        const sidebar =
            document.getElementById(
                "adminSidebar"
            );


        if (!sidebar) {

            return;

        }


        if (window.innerWidth > 768) {

            sidebar.classList.remove(
                "mobile-open"
            );

        }

    }
);