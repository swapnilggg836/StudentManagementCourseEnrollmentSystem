<!-- ==============================
     APPLICATION ALERTS
================================ -->

<% if (request.getAttribute("success") != null) { %>

    <div class="alert alert-success alert-dismissible fade show"
         role="alert">

        <i class="bi bi-check-circle-fill me-2"></i>

        <%= request.getAttribute("success") %>

        <button type="button"
                class="btn-close"
                data-bs-dismiss="alert"
                aria-label="Close">
        </button>

    </div>

<% } %>


<% if (request.getAttribute("error") != null) { %>

    <div class="alert alert-danger alert-dismissible fade show"
         role="alert">

        <i class="bi bi-exclamation-triangle-fill me-2"></i>

        <%= request.getAttribute("error") %>

        <button type="button"
                class="btn-close"
                data-bs-dismiss="alert"
                aria-label="Close">
        </button>

    </div>

<% } %>


<% if (request.getAttribute("warning") != null) { %>

    <div class="alert alert-warning alert-dismissible fade show"
         role="alert">

        <i class="bi bi-exclamation-circle-fill me-2"></i>

        <%= request.getAttribute("warning") %>

        <button type="button"
                class="btn-close"
                data-bs-dismiss="alert"
                aria-label="Close">
        </button>

    </div>

<% } %>


<% if (request.getAttribute("info") != null) { %>

    <div class="alert alert-info alert-dismissible fade show"
         role="alert">

        <i class="bi bi-info-circle-fill me-2"></i>

        <%= request.getAttribute("info") %>

        <button type="button"
                class="btn-close"
                data-bs-dismiss="alert"
                aria-label="Close">
        </button>

    </div>

<% } %>