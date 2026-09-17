<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!-- =========================================================
     COURSE INFORMATION
     ========================================================= -->

<div class="row g-4">


    <!-- =====================================================
         COURSE CODE
         ===================================================== -->

    <div class="col-md-6">

        <label for="courseCode" class="form-label">
            Course Code
            <span class="text-danger">*</span>
        </label>

        <input type="text"
               id="courseCode"
               name="courseCode"
               class="form-control"
               value="${course.courseCode}"
               placeholder="Example: CS101"
               maxlength="30"
               required>

        <div class="form-text">
            Enter a unique course code.
        </div>

    </div>


    <!-- =====================================================
         COURSE TITLE
         ===================================================== -->

    <div class="col-md-6">

        <label for="title" class="form-label">
            Course Title
            <span class="text-danger">*</span>
        </label>

        <input type="text"
               id="title"
               name="title"
               class="form-control"
               value="${course.title}"
               placeholder="Example: Data Structures"
               maxlength="150"
               required>

    </div>


    <!-- =====================================================
         DESCRIPTION
         ===================================================== -->

    <div class="col-12">

        <label for="description" class="form-label">
            Description
        </label>

        <textarea id="description"
                  name="description"
                  class="form-control"
                  rows="4"
                  placeholder="Enter course description...">${course.description}</textarea>

    </div>


    <!-- =====================================================
         CREDITS
         ===================================================== -->

    <div class="col-md-4">

        <label for="credits" class="form-label">
            Credits
            <span class="text-danger">*</span>
        </label>

        <input type="number"
               id="credits"
               name="credits"
               class="form-control"
               value="${course.credits}"
               min="1"
               required>

    </div>


    <!-- =====================================================
         DEPARTMENT
         ===================================================== -->

    <div class="col-md-4">

        <label for="deptId" class="form-label">
            Department
            <span class="text-danger">*</span>
        </label>

        <select id="deptId"
                name="deptId"
                class="form-select"
                required>

            <option value="">
                Select Department
            </option>


            <c:forEach var="department"
                       items="${departments}">

                <option value="${department.deptId}"
                        <c:if test="${department.deptId == course.deptId}">
                            selected
                        </c:if>>

                    ${department.deptCode} -
                    ${department.deptName}

                </option>

            </c:forEach>

        </select>

    </div>


    <!-- =====================================================
         FACULTY
         ===================================================== -->

    <div class="col-md-4">

        <label for="facultyId" class="form-label">
            Faculty
        </label>

        <select id="facultyId"
                name="facultyId"
                class="form-select">

            <option value="">
                No Faculty Assigned
            </option>


            <c:forEach var="f"
                       items="${faculty}">

                <option value="${f.facultyId}"
                        <c:if test="${f.facultyId == course.facultyId}">
                            selected
                        </c:if>>

                    ${f.employeeCode} -
                    ${f.firstName} ${f.lastName}

                </option>

            </c:forEach>

        </select>

        <div class="form-text">
            Faculty assignment is optional.
        </div>

    </div>


    <!-- =====================================================
         CAPACITY
         ===================================================== -->

    <div class="col-md-4">

        <label for="capacity" class="form-label">
            Student Capacity
            <span class="text-danger">*</span>
        </label>

        <input type="number"
               id="capacity"
               name="capacity"
               class="form-control"
               value="${course.capacity > 0 ? course.capacity : 30}"
               min="1"
               required>

        <c:if test="${course.courseId > 0}">

            <div class="form-text">

                Currently available:
                <strong>${course.availableSeats}</strong>
                seats

            </div>

        </c:if>

    </div>


    <!-- =====================================================
         SCHEDULE DAY
         ===================================================== -->

    <div class="col-md-4">

        <label for="scheduleDay" class="form-label">
            Schedule Day
        </label>

        <select id="scheduleDay"
                name="scheduleDay"
                class="form-select">

            <option value="">
                Select Day
            </option>

            <option value="Monday"
                <c:if test="${course.scheduleDay == 'Monday'}">
                    selected
                </c:if>>
                Monday
            </option>

            <option value="Tuesday"
                <c:if test="${course.scheduleDay == 'Tuesday'}">
                    selected
                </c:if>>
                Tuesday
            </option>

            <option value="Wednesday"
                <c:if test="${course.scheduleDay == 'Wednesday'}">
                    selected
                </c:if>>
                Wednesday
            </option>

            <option value="Thursday"
                <c:if test="${course.scheduleDay == 'Thursday'}">
                    selected
                </c:if>>
                Thursday
            </option>

            <option value="Friday"
                <c:if test="${course.scheduleDay == 'Friday'}">
                    selected
                </c:if>>
                Friday
            </option>

            <option value="Saturday"
                <c:if test="${course.scheduleDay == 'Saturday'}">
                    selected
                </c:if>>
                Saturday
            </option>

            <option value="Sunday"
                <c:if test="${course.scheduleDay == 'Sunday'}">
                    selected
                </c:if>>
                Sunday
            </option>

        </select>

    </div>


    <!-- =====================================================
         SCHEDULE TIME
         ===================================================== -->

    <div class="col-md-4">

        <label for="scheduleTime" class="form-label">
            Schedule Time
        </label>

        <input type="text"
               id="scheduleTime"
               name="scheduleTime"
               class="form-control"
               value="${course.scheduleTime}"
               placeholder="Example: 10:00 AM - 11:00 AM"
               maxlength="50">

    </div>


    <!-- =====================================================
         COURSE FEE
         ===================================================== -->

    <div class="col-md-4">

        <label for="feeAmount" class="form-label">
            Course Fee
            <span class="text-danger">*</span>
        </label>

        <div class="input-group">

            <span class="input-group-text">
                ₹
            </span>

            <input type="number"
                   id="feeAmount"
                   name="feeAmount"
                   class="form-control"
                   value="${course.feeAmount}"
                   min="0"
                   step="0.01"
                   required>

        </div>

    </div>


</div>


<!-- =========================================================
     FORM ACTIONS
     ========================================================= -->

<div class="d-flex justify-content-end
            gap-2 mt-4 pt-4 border-top">


    <a href="${pageContext.request.contextPath}/admin/courses"
       class="btn btn-outline-secondary">

        <i class="bi bi-x-circle me-2"></i>

        Cancel

    </a>


    <c:choose>

        <!-- EDIT -->

        <c:when test="${course.courseId > 0}">

            <button type="submit"
                    class="btn btn-primary">

                <i class="bi bi-check-circle me-2"></i>

                Update Course

            </button>

        </c:when>


        <!-- ADD -->

        <c:otherwise>

            <button type="submit"
                    class="btn btn-primary">

                <i class="bi bi-plus-circle me-2"></i>

                Add Course

            </button>

        </c:otherwise>

    </c:choose>

</div>