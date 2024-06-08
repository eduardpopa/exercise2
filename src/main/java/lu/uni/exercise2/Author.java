
package lu.uni.exercise2;

import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Transient;
import jakarta.persistence.JoinColumn;
import jakarta.transaction.Transactional;
import java.io.Serializable;
import java.util.List;

@RequestScoped
@Named("author")
@Entity(name = "author")
@Transactional
public class Author implements Serializable {

  @Id
  private Long id;
  @Column(name = "first_name")
  private String firstName;
  @Column(name = "last_name")
  private String lastName;

  @ManyToMany(fetch = FetchType.LAZY)
  @JoinTable(name = "document_author", joinColumns = @JoinColumn(name = "author_id", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "document_id", referencedColumnName = "id"))
  private List<Document> documents;

  @Inject
  @Transient

  private AuthorService service;

  public String getById() {
    Author author = service.getById(this.id);
    if (author != null) {
      this.firstName = author.firstName;
      this.lastName = author.lastName;
      this.documents = author.documents;
      this.documents.size();
    } else {
      this.id = null;
      this.firstName = null;
      this.lastName = null;
      this.documents = null;
    }
    return "author";
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getFirstName() {
    return firstName;
  }

  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  public String getLastName() {
    return lastName;
  }

  public void setLastName(String lastName) {
    this.lastName = lastName;
  }

  public List<Document> getDocuments() {
    return documents;
  }

  public void setDocuments(List<Document> documents) {
    this.documents = documents;
  }
}
