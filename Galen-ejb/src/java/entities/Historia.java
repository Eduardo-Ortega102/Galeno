package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "HISTORIA")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Historia.findAll", query = "SELECT h FROM Historia h")
    , @NamedQuery(name = "Historia.findById", query = "SELECT h FROM Historia h WHERE h.id = :id")
    , @NamedQuery(name = "Historia.findByFechacreacion", query = "SELECT h FROM Historia h WHERE h.fechacreacion = :fechacreacion")
    , @NamedQuery(name = "Historia.findByDescripcion", query = "SELECT h FROM Historia h WHERE h.descripcion = :descripcion")})
public class Historia implements Serializable {

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
    @Column(name = "DESCRIPCION")
    private String descripcion;
    @JoinColumn(name = "HISTORIAL", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Historial historial;
    @JoinColumn(name = "MEDICO", referencedColumnName = "COLEGIADO")
    @ManyToOne(optional = false)
    private Medico medico;

    public Historia() {
    }

    public Historia(Integer id) {
        this.id = id;
    }

    public Historia(Integer id, String fechacreacion, String descripcion) {
        this.id = id;
        this.fechacreacion = fechacreacion;
        this.descripcion = descripcion;
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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Historial getHistorial() {
        return historial;
    }

    public void setHistorial(Historial historial) {
        this.historial = historial;
    }

    public Medico getMedico() {
        return medico;
    }

    public void setMedico(Medico medico) {
        this.medico = medico;
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
        if (!(object instanceof Historia)) {
            return false;
        }
        Historia other = (Historia) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Historia[ id=" + id + " ]";
    }
    
}
