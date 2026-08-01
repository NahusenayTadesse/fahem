<script lang="ts">
	import ContentPage from '$lib/dashboard/content-page.svelte';
	import {
		column,
		deleteColumn,
		editColumn,
		imageColumn,
		indexColumn,
		listColumn,
		longColumn
	} from '$lib/dashboard/columns';
	import type { CrudField } from '$lib/components/Table/crud-dialog.svelte';

	let { data } = $props();

	const fields: CrudField[] = [
		{ name: 'name', label: 'Farm name', type: 'text', required: true },
		{ name: 'location', label: 'Location', type: 'text', placeholder: 'e.g. Limmu, Oromia' },
		{ name: 'image', label: 'Photo', type: 'file' },
		{ name: 'description', label: 'Description', type: 'textarea', rows: 3 },
		{ name: 'altitude', label: 'Altitude', type: 'text', placeholder: 'e.g. 1,900-2,100m' },
		{ name: 'grade', label: 'Grade', type: 'text', placeholder: 'e.g. Specialty Grade 1' },
		{ name: 'stats', label: 'Key facts', type: 'textarea', placeholder: 'One fact per line, e.g. 200 hectares', rows: 4 },
		{ name: 'sortOrder', label: 'Display order', type: 'number' }
	];

	const columns = [
		indexColumn,
		column('name', 'Name'),
		column('location', 'Location'),
		imageColumn('image', 'Photo'),
		longColumn('description', 'Description'),
		listColumn('stats', 'Key facts'),
		column('sortOrder', 'Order'),
		editColumn({
			data: data.editForm,
			fields,
			title: 'Edit Farm',
			keys: ['name', 'location', 'description', 'altitude', 'grade', 'stats', 'sortOrder'],
			fileKeys: ['image'],
			listKeys: ['stats']
		}),
		deleteColumn(data.deleteForm, 'name')
	];
</script>

<ContentPage
	title="Farms"
	description="Shown on the home page and the Our Coffee page."
	addTitle="Add Farm"
	addForm={data.addForm}
	{fields}
	{columns}
	rows={data.rows}
/>
