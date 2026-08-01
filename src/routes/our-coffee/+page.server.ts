import { and, asc, eq, isNull } from 'drizzle-orm';
import { db } from '$lib/server/db';
import { getHero, list, listFaqs, listGallery } from '$lib/server/content';
import { coffeeRegions, farms, subRegions, traceabilitySteps } from '$lib/server/db/schema';
import type { PageServerLoad } from './$types';

/** Sub-regions are shown grouped under their farm, so the farm name comes along. */
const listSubRegions = () =>
	db
		.select({
			name: subRegions.name,
			altitude: subRegions.altitude,
			notes: subRegions.notes,
			farmName: farms.name
		})
		.from(subRegions)
		.leftJoin(farms, eq(subRegions.farmId, farms.id))
		.where(and(eq(subRegions.isActive, true), isNull(subRegions.deletedAt)))
		.orderBy(asc(subRegions.sortOrder), asc(subRegions.id));

export const load: PageServerLoad = async () => {
	const [hero, allFarms, subs, regions, steps, allFaqs, gallery] = await Promise.all([
		getHero('our-coffee'),
		list(farms),
		listSubRegions(),
		list(coffeeRegions),
		list(traceabilitySteps),
		listFaqs('our-coffee'),
		listGallery('our-coffee')
	]);

	return {
		hero,
		farms: allFarms,
		subRegions: subs,
		regions,
		steps,
		faqs: allFaqs,
		gallery
	};
};
