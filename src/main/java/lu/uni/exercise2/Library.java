package lu.uni.exercise2;

import java.io.Serializable;
import java.util.Calendar;
import java.util.List;
import jakarta.annotation.PostConstruct;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.transaction.Transactional;

@SessionScoped
@Named("library")
@Transactional
public class Library implements Serializable {

    private int year;
    private List<Integer> years;
    private List<Document> documents;

    @Inject
    private DocumentService service;

    @PostConstruct
    public void init() {
        years = service.getYears();
        year = Calendar.getInstance().get(Calendar.YEAR);
        documents = service.getByYear(year);
    }

    public String getByYear() {
        documents = service.getByYear(year);
        return "results";
    }

    public List<Document> getDocuments() {
        return documents;
    }

    public void setDocuments(List<Document> documents) {
        this.documents = documents;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public List<Integer> getYears() {
        return years;
    }

    public void setYears(List<Integer> years) {
        this.years = years;
    }
}
