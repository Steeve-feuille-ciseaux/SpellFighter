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
let player;
const updateInterval = 2000; // Interval pour mettre à jour le compteur (2 secondes)

function preload() {
    // Préchargement des ressources si nécessaire
    this.load.image('background', 'asset/images/stage/stage1.jpg');
    this.load.spritesheet('player', 'asset/images/champion/Elise/E_Idle.png', { frameWidth: 100, frameHeight: 64 });
    this.load.spritesheet('playerAtk1', 'asset/images/champion/Elise/E_Attack1.png', { frameWidth: 100, frameHeight: 64 });
    this.load.spritesheet('playerAtk2', 'asset/images/champion/Elise/E_Attack2.png', { frameWidth: 100, frameHeight: 64 });
    this.load.spritesheet('playerAtk3', 'asset/images/champion/Elise/E_Attack3.png', { frameWidth: 100, frameHeight: 64 });
    this.load.spritesheet('playerAtk4', 'asset/images/champion/Elise/E_Attack4.png', { frameWidth: 100, frameHeight: 64 });
    this.load.spritesheet('playerDrk', 'asset/images/champion/Elise/E_Drink.png', { frameWidth: 100, frameHeight: 64 });
    this.load.spritesheet('playerWin', 'asset/images/champion/Elise/E_Win.png', { frameWidth: 100, frameHeight: 64 });
    this.load.spritesheet('playerPowerUp', 'asset/images/champion/Elise/E_PowerUp.png', { frameWidth: 100, frameHeight: 64 });
    this.load.spritesheet('playerShield1', 'asset/images/champion/Elise/E_Shield1.png', { frameWidth: 100, frameHeight: 64 });
    this.load.spritesheet('playerShield2', 'asset/images/champion/Elise/E_Shield2.png', { frameWidth: 100, frameHeight: 64 });
    this.load.spritesheet('playerShield3', 'asset/images/champion/Elise/E_Shield3.png', { frameWidth: 100, frameHeight: 64 });
}

function create() {
    // Ajouter un fond d'écran
    const background = this.add.image(0, 0, 'background'); // Remplacez 'background' par le nom de votre image de fond
    background.setOrigin(0, 0); // Définir l'origine en haut à gauche
    background.setScale(config.width / background.width, config.height / background.height); // Redimensionner pour remplir la scène
    
    // Ajouter le personnage au milieu à gauche
    const player = this.add.sprite(config.width / 4, 450); // Remplacez 'character' par le nom de votre feuille de sprite
    player.setOrigin(0.5, 0.5); // Centrer l'image autour de son point d'origine
    player.setScale(6.25,5.5);
    console.log(config.height / player.height)

    // Créer l'animation du personnage
    this.anims.create(
        {
        key: 'idle', // Nom de l'animation
        frames: this.anims.generateFrameNumbers('player', { start: 0, end: 3 }), // Numéros de trames dans la feuille de sprite
        frameRate: 7.5, // Vitesse de l'animation (images par seconde)
        repeat: -1 // Répétition infinie
    });
    this.anims.create({
        key: 'attack1', // Nom de l'animation
        frames: this.anims.generateFrameNumbers('playerAtk1', { start: 0, end: 5 }), // Numéros de trames dans la feuille de sprite
        frameRate: 12.5, // Vitesse de l'animation (images par seconde)
        repeat: 0 // Répétition infinie
    });
    this.anims.create({
        key: 'attack2', // Nom de l'animation
        frames: this.anims.generateFrameNumbers('playerAtk2', { start: 0, end: 5 }), // Numéros de trames dans la feuille de sprite
        frameRate: 12.5, // Vitesse de l'animation (images par seconde)
        repeat: 0 // Répétition infinie
    });
    this.anims.create({
        key: 'attack3', // Nom de l'animation
        frames: this.anims.generateFrameNumbers('playerAtk3', { start: 0, end: 8 }), // Numéros de trames dans la feuille de sprite
        frameRate: 15, // Vitesse de l'animation (images par seconde)
        repeat: 0 // Répétition infinie
    });
    this.anims.create({
        key: 'attack4', // Nom de l'animation
        frames: this.anims.generateFrameNumbers('playerAtk4', { start: 0, end: 4 }), // Numéros de trames dans la feuille de sprite
        frameRate: 15, // Vitesse de l'animation (images par seconde)
        repeat: 2 // Répétition infinie
    });
    this.anims.create({
        key: 'drink', // Nom de l'animation
        frames: this.anims.generateFrameNumbers('playerDrk', { start: 0, end: 6 }), // Numéros de trames dans la feuille de sprite
        frameRate: 7.5, // Vitesse de l'animation (images par seconde)
        repeat: 0 // Répétition infinie
    });
    this.anims.create({
        key: 'win', // Nom de l'animation
        frames: this.anims.generateFrameNumbers('playerWin', { start: 0, end: 4 }), // Numéros de trames dans la feuille de sprite
        frameRate: 5, // Vitesse de l'animation (images par seconde)
        repeat: 0 // Répétition infinie
    });
    this.anims.create({
        key: 'powerUp', // Nom de l'animation
        frames: this.anims.generateFrameNumbers('playerPowerUp', { start: 0, end: 9 }), // Numéros de trames dans la feuille de sprite
        frameRate: 10, // Vitesse de l'animation (images par seconde)
        repeat: 0 // Répétition infinie
    });
    this.anims.create({
        key: 'shield1', // Nom de l'animation
        frames: this.anims.generateFrameNumbers('playerShield1', { start: 0, end: 6 }), // Numéros de trames dans la feuille de sprite
        frameRate: 15, // Vitesse de l'animation (images par seconde)
        repeat: 0 // Répétition infinie
    });
    this.anims.create({
        key: 'shield2', // Nom de l'animation
        frames: this.anims.generateFrameNumbers('playerShield2', { start: 0, end: 3 }), // Numéros de trames dans la feuille de sprite
        frameRate: 10, // Vitesse de l'animation (images par seconde)
        repeat: -1 // Répétition infinie
    });
    this.anims.create({
        key: 'shield3', // Nom de l'animation
        frames: this.anims.generateFrameNumbers('playerShield3', { start: 0, end: 4 }), // Numéros de trames dans la feuille de sprite
        frameRate: 10, // Vitesse de l'animation (images par seconde)
        repeat: 0 // Répétition infinie
    });

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

    // Créer un élément pour déclencher l'animation d'attaque en appuyant sur "A"
    const buttonA = this.input.keyboard.addKey('A');
    const buttonZ = this.input.keyboard.addKey('Z');
    const buttonE = this.input.keyboard.addKey('E');
    const buttonR = this.input.keyboard.addKey('R');
    const buttonQ = this.input.keyboard.addKey('Q');
    const buttonW = this.input.keyboard.addKey('W');
    const buttonX = this.input.keyboard.addKey('X');
    const buttonD = this.input.keyboard.addKey('D');
    const buttonF = this.input.keyboard.addKey('F');
    const buttonG = this.input.keyboard.addKey('G');

    buttonA.on('down', () => {
        player.play('attack1');
    });
    buttonZ.on('down', () => {
        player.play('attack2');
    });
    buttonE.on('down', () => {
        player.play('attack3');
    });
    buttonR.on('down', () => {
        player.play('attack4');
    });
    buttonQ.on('down', () => {
        player.play('drink');
    });
    buttonW.on('down', () => {
        player.play('win');
    });
    buttonX.on('down', () => {
        player.play('powerUp');
    });
    buttonD.on('down', () => {
        player.play('shield1');
    });
    buttonF.on('down', () => {
        player.play('shield2');
    });
    buttonG.on('down', () => {
        player.play('shield3');
    });

    // Écouter l'événement animationcomplete pour revenir à l'animation idle à la fin de l'animation d'attaque
    player.on('animationcomplete', (animation) => {
        if (animation.key === 'attack1') {
            player.play('idle');
        } 
        if (animation.key === 'attack2')  {
            player.play('idle');
        }
        if (animation.key === 'attack3')  {
            player.play('idle');
        }
        if (animation.key === 'attack4')  {
            player.play('idle');
        }
        if (animation.key === 'drink')  {
            player.play('idle');
        }
        if (animation.key === 'win')  {
            player.play('idle');
        }
        if (animation.key === 'powerUp')  {
            player.play('idle');
        }
        if (animation.key === 'shield1')  {
            player.play('idle');
        }
        if (animation.key === 'shield2')  {
            player.play('idle');
        }
        if (animation.key === 'shield3')  {
            player.play('idle');
        }
    });

    // Jouer l'animation
    player.play('idle');
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
