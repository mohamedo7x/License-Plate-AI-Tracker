const Animations = {

    displayList: {
        hidden: {opacity:0, height: 0},
        visible: {opacity: 1, height: 'fit-content', transition: {duration: 0.3}},
        exit: {opacity: 0, height: 0, transition: {duration: 0.3}}
    },

};

export default Animations;