# Simulation de tsunami

On veut simuler un tsunami via l'équation en eaux peu profondes, ou équations de Saint-Venant. Ces équations sont intéressantes car elles permettent de reproduire de nombreux mouvements observés dans l'atmosphère et dans l'océan (TODO: Ajouter exemples)

Les équations prennent la forme suivante :

$$ \frac{\partial u }{\partial t} + \vec{u}\cdot \nabla \vec{u} = - g\nabla h$$

$$ \frac{\partial h}{\partial t} =  - \nabla \cdot \left(\vec{u}  \left(H + h \right)\right)$$
où $\vec{u}$ est le 2-vecteur de vitesse, $g$ est l'accélération gravitationnelle, $h$ est l'élévation de l'eau et $H$ est la profondeur de l'eau non perturbée. Bien entendu, $t$ est la variable temporelle.

## 1. Résolution en 1 dimension

Nous considérons l'équation d'advection selon l'axe $x$, et réécrivons la première équation

$$  \frac{\partial u }{\partial t} + c\frac{\partial u }{\partial x} = 0$$

Pour résoudre cette équation nous utilisons la méthode des différences finies. C'est-à-dire, nous approximons les dérivées par de petites variations, ou différences, $\delta$ :

$$  \frac{\partial u }{\partial t} \approx \frac{\Delta u }{\Delta t} = \frac{u_{i}^{n+1} - u_i^n}{\Delta t}$$
et
$$\frac{\partial u }{\partial x} \approx \frac{\Delta u }{\Delta x} = \frac{u_{i}^{n} - u_{i-1}^{n}}{\Delta x}$$
où les indices $i$ et $n$ courent respectivement sur les ensembles discrets de temps et d'espace.

