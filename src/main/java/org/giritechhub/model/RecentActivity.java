package org.giritechhub.model;

public class RecentActivity {

    private String activityType;
    private String description;
    private String reference;
    private String status;
    private String activityDate;

    public RecentActivity() {
    }

    public RecentActivity(
            String activityType,
            String description,
            String reference,
            String status,
            String activityDate) {

        this.activityType = activityType;
        this.description = description;
        this.reference = reference;
        this.status = status;
        this.activityDate = activityDate;
    }

    public String getActivityType() {
        return activityType;
    }

    public void setActivityType(String activityType) {
        this.activityType = activityType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getActivityDate() {
        return activityDate;
    }

    public void setActivityDate(String activityDate) {
        this.activityDate = activityDate;
    }
}