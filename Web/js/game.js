// Créer une configuration de jeu
const config = {
    type: Phaser.AUTO,
    width: 1200,
    height: 700,
    scene: {
        preload: preload,
        create: create,
        update: update
    }
};

// Initialiser le jeu avec la configuration
const game = new Phaser.Game(config);

let count = 60;
let text;
let leftHealthBar;
let rightHealthBar;
let timePassed = 0; // Temps écoulé en millisecondes
const updateInterval = 2000; // Interval pour mettre à jour le compteur (2 secondes)

function preload() {
    // Préchargement des ressources si nécessaire
    this.load.image('background', 'asset/images/stage1.jpg');
}

function create() {
    // Ajouter un fond d'écran
    const background = this.add.image(0, 0, 'background'); // Remplacez 'background' par le nom de votre image de fond
    background.setOrigin(0, 0); // Définir l'origine en haut à gauche
    background.setScale(config.width / background.width, config.height / background.height); // Redimensionner pour remplir la scène

    // Créer un texte pour afficher le compteur
    text = this.add.text(config.width / 2, 15,count, { font: '24px Arial', fill: '#ffffff' });
    text.setOrigin(0.5, 0); // Centrer le texte en haut

    // Créer les barres de vie
    leftHealthBar = this.add.rectangle(config.width / 4, 30, 250, 20, 0xff0000); // red life
    leftHealthBar = this.add.rectangle(config.width / 4, 30, 250, 20, 0x006600); // green life
    leftHealthBar.setStrokeStyle(2, 0xffffff); // Cadre blanc autour de la barre de vie

    rightHealthBar = this.add.rectangle(config.width * 3 / 4, 30, 250, 20, 0xff3300); // red life
    rightHealthBar = this.add.rectangle(config.width * 3 / 4, 30, 250, 20, 0x006600);
    rightHealthBar.setStrokeStyle(2, 0xffffff); // Cadre blanc autour de la barre de vie
}

function update(time, delta) {
    // Mettre à jour le temps écoulé
    timePassed += delta;

    // Vérifier si le temps écoulé est supérieur à l'intervalle de mise à jour
    if (timePassed >= updateInterval) {
        // Réinitialiser le temps écoulé
        timePassed -= updateInterval;

        // Mettre à jour le compteur et le texte
        if (count > 0) {
            count--;
            text.setText(count);
        }

        // Mettre à jour la largeur des barres de vie
        leftHealthBar.width = 250;
        rightHealthBar.width = 100;
    }
}
