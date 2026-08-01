import { contentCrud } from '$lib/server/crud';
import { db } from '$lib/server/db';
import { subRegions, farms } from '$lib/server/db/schema';
import { asc } from 'drizzle-orm';
import { addSchema, editSchema } from './schema';
import type { Actions, PageServerLoad } from './$types';

const crud = contentCrud({
	table: subRegions,
	label: 'Sub-region',
	addSchema,
	editSchema
});

export const load: PageServerLoad = async () => {
	const [base, farmList] = await Promise.all([
		crud.load(),
		db.select({ id: farms.id, name: farms.name }).from(farms).orderBy(asc(farms.sortOrder))
	]);

	return { ...base, farmList };
};

export const actions: Actions = crud.actions;
