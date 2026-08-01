<script lang="ts">
	import ContentPage from '$lib/dashboard/content-page.svelte';
	import {
		column,
		deleteColumn,
		editColumn,
		indexColumn,
		longColumn
	} from '$lib/dashboard/columns';
	import type { CrudField } from '$lib/components/Table/crud-dialog.svelte';

	let { data } = $props();

	// Select works in strings; the schema coerces the id back to a number.
	const farmItems = $derived(
		data.farmList.map((farm) => ({ value: String(farm.id), name: farm.name }))
	);

	const fields: CrudField[] = $derived([
		{ name: 'farmId', label: 'Farm', type: 'select', required: true, items: farmItems },
		{ name: 'name', label: 'Sub-region name', type: 'text', required: true, placeholder: 'e.g. Limmu Kossa Woreda' },
		{ name: 'altitude', label: 'Altitude', type: 'text', placeholder: 'e.g. 1750-2000m' },
		{ name: 'notes', label: 'Characteristics', type: 'textarea', rows: 3 },
		{ name: 'sortOrder', label: 'Display order', type: 'number' }
	]);

	const columns = $derived([
		indexColumn,
		column('name', 'Name'),
		column('altitude', 'Altitude'),
		longColumn('notes', 'Characteristics'),
		column('sortOrder', 'Order'),
		editColumn({
			data: data.editForm,
			fields,
			title: 'Edit Sub-region',
			keys: ['farmId', 'name', 'altitude', 'notes', 'sortOrder']
		}),
		deleteColumn(data.deleteForm, 'name')
	]);
</script>

<ContentPage
	title="Farm Sub-regions"
	description="The altitude and tasting table shown under the farms on the Our Coffee page."
	addTitle="Add Sub-region"
	addForm={data.addForm}
	{fields}
	{columns}
	rows={data.rows}
/>
