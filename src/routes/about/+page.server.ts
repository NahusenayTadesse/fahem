import { getHero, list, listFaqs, listGallery, listMilestones } from '$lib/server/content';
import { partners, valueProps } from '$lib/server/db/schema';
import type { PageServerLoad } from './$types';

export const load: PageServerLoad = async () => {
	const [hero, milestones, whyFahem, allPartners, gallery, faqs] = await Promise.all([
		getHero('about'),
		listMilestones('about'),
		list(valueProps),
		list(partners),
		listGallery('about'),
		listFaqs('about')
	]);

	return { hero, milestones, whyFahem, partners: allPartners, gallery, faqs };
};
