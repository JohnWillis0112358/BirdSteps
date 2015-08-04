var myApp = angular.module('birdSteppington', []);

myApp.controller('MagicController', function($scope) {
    $scope.Steps = [
        { question: 'What color is the sky?', answer: "Red, you fucking idiot." },
        { question: 'How many skittles?', answer: "Eleventy" },
        { question: 'How do I shot web?', answer: "FUCK YOU SPIDERMAN" },
        { question: 'All your base are belong to us', answer: "Take off every Zig!" },
        { question: 'What does a vegan not partake?', answer: "A vegan does not partake of the meat, nor the breastmilk, nor the ovum, of any creature, with a face." },
    ];
});