import { contentCrud } from '$lib/server/crud';
import { farms } from '$lib/server/db/schema';
import { addSchema, editSchema } from './schema';
import type { Actions, PageServerLoad } from './$types';

const crud = contentCrud({
	table: farms,
	label: 'Farm',
	addSchema,
	editSchema,
	fileFields: ['image'],
	listFields: ['stats']
});

export const load: PageServerLoad = crud.load;
export const actions: Actions = crud.actions;
