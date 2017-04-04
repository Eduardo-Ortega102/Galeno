package entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "HISTORIAL")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Historial.findAll", query = "SELECT h FROM Historial h")
    , @NamedQuery(name = "Historial.findById", query = "SELECT h FROM Historial h WHERE h.id = :id")
    , @NamedQuery(name = "Historial.findByFechacreacion", query = "SELECT h FROM Historial h WHERE h.fechacreacion = :fechacreacion")
    , @NamedQuery(name = "Historial.findByPaciente", query = "SELECT h FROM Historial h WHERE h.paciente = :paciente")
    , @NamedQuery(name = "Historial.findByAlergias", query = "SELECT h FROM Historial h WHERE h.alergias = :alergias")})
public class Historial implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "FECHACREACION")
    private String fechacreacion;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "ALERGIAS")
    private String alergias;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "historial")
    private Collection<Historia> historiaCollection;
    @JoinColumn(name = "PACIENTE", referencedColumnName = "DNI")
    @OneToOne(optional = false)
    private Paciente paciente;

    public Historial() {
    }

    public Historial(Integer id) {
        this.id = id;
    }

    public Historial(Integer id, String fechacreacion, String alergias) {
        this.id = id;
        this.fechacreacion = fechacreacion;
        this.alergias = alergias;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFechacreacion() {
        return fechacreacion;
    }

    public void setFechacreacion(String fechacreacion) {
        this.fechacreacion = fechacreacion;
    }

    public String getAlergias() {
        return alergias;
    }

    public void setAlergias(String alergias) {
        this.alergias = alergias;
    }

    @XmlTransient
    public Collection<Historia> getHistoriaCollection() {
        return historiaCollection;
    }

    public void setHistoriaCollection(Collection<Historia> historiaCollection) {
        this.historiaCollection = historiaCollection;
    }

    public Paciente getPaciente() {
        return paciente;
    }

    public void setPaciente(Paciente paciente) {
        this.paciente = paciente;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Historial)) {
            return false;
        }
        Historial other = (Historial) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Historial[ id=" + id + " ]";
    }
    
}
