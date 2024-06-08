package lu.uni.exercise2;

import java.io.Serializable;
import java.sql.Date;
import java.util.Set;
import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Transient;
import jakarta.transaction.Transactional;

@RequestScoped
@Named("document")
@Entity(name = "document")
@Transactional
public class Document implements Serializable {
    @Id
    private Long id;
    private String title;
    @Column(name = "publication_date")
    private Date publicationDate;
    @Column(name = "abstract")
    private String description;
    @Column(name = "storage_location")
    private String storageLocation;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "document_author", joinColumns = @JoinColumn(name = "document_id", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "author_id", referencedColumnName = "id"))
    private Set<Author> authors;

    @Inject
    @Transient
    private DocumentService service;

    public String getById() {
        Document document = service.getById(id);
        if (document != null) {
            this.title = document.title;
            this.publicationDate = document.publicationDate;
            this.description = document.description;
            this.storageLocation = document.storageLocation;
            this.authors = document.authors;
            this.authors.size();
        } else {
            this.id = null;
            this.title = null;
            this.publicationDate = null;
            this.description = null;
            this.storageLocation = null;
            this.authors = null;
        }

        return "document";
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getPublicationDate() {
        return publicationDate;
    }

    public void setPublicationDate(Date publicationDate) {
        this.publicationDate = publicationDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStorageLocation() {
        return storageLocation;
    }

    public void setStorageLocation(String storageLocation) {
        this.storageLocation = storageLocation;
    }

    public Set<Author> getAuthors() {
        return authors;
    }

    public void setAuthors(Set<Author> authors) {
        this.authors = authors;
    }

    @Override
    public String toString() {
        String out = "Document[ id=" + id + " ] authors:" + authors.size();

        return out;
    }

}
