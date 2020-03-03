document.addEventListener('DOMContentLoaded', () => {
	const $exploreCards = document.getElementsByClassName('explore-card');
	const $exploreCardContents = document.getElementsByClassName('explore-card-content');

	Array.from($exploreCardContents).forEach((cardContents) => {
		cardContents.hidden = true
	})

	console.log($exploreCards)

	Array.from($exploreCards).forEach((exploreCard) => {
		exploreCard.addEventListener('mouseenter', (event) => {
			Array.from($exploreCardContents).forEach((cardContents) => {
				if (event.currentTarget.contains(cardContents)) {
					cardContents.hidden = false;
				}
			})
		});

		exploreCard.addEventListener('mouseleave', (event) => {
			Array.from($exploreCardContents).forEach((cardContents) => {
				if (event.currentTarget.contains(cardContents)) {
					cardContents.hidden = true;
				}
			})
		});
	})


})