package lu.uni.exercise2;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Named;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Named
@ApplicationScoped
public class AuthorService {

    @PersistenceContext(unitName = "exercise2")
    private EntityManager entityManager;

    public Author getById(Long id) {
        return entityManager.find(Author.class, id);
    }
}
