package lu.uni.exercise2;

import java.util.List;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Named;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Named
@ApplicationScoped
public class DocumentService {

    @PersistenceContext(unitName = "exercise2")
    private EntityManager entityManager;

    public List<Integer> getYears() {
        return entityManager
                .createQuery(
                        "SELECT DISTINCT YEAR(doc.publicationDate) FROM document doc ORDER BY YEAR(doc.publicationDate) DESC",
                        Integer.class)
                .getResultList();
    }

    public List<Document> getByYear(int year) {
        return entityManager
                .createQuery(
                        "SELECT doc FROM document doc WHERE YEAR(doc.publicationDate) = :year ORDER BY doc.title ASC",
                        Document.class)
                .setParameter("year", year)
                .getResultList();
    }

    public Document getById(Long id) {
        return entityManager.find(Document.class, id);
    }

}
