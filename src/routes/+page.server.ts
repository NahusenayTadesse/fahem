import { getHero, list, listFaqs, listGallery, listMilestones } from '$lib/server/content';
import { coffeeProducts, exportMarkets, farms } from '$lib/server/db/schema';
import type { PageServerLoad } from './$types';

export const load: PageServerLoad = async () => {
	const [hero, products, allFarms, milestones, markets, gallery, faqs] = await Promise.all([
		getHero('home'),
		list(coffeeProducts),
		list(farms),
		listMilestones('home'),
		list(exportMarkets),
		listGallery('home'),
		listFaqs('home')
	]);

	return { hero, products, farms: allFarms, milestones, markets, gallery, faqs };
};
