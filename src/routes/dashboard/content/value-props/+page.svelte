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
	import { iconNames } from '$lib/components/dynamic-icon.svelte';

	let { data } = $props();

	const iconItems = iconNames.map((name) => ({ value: name, name }));

	const fields: CrudField[] = [
		{ name: 'icon', label: 'Icon', type: 'select', items: iconItems },
		{ name: 'title', label: 'Title', type: 'text', required: true },
		{ name: 'description', label: 'Description', type: 'textarea', rows: 3 },
		{ name: 'sortOrder', label: 'Display order', type: 'number' }
	];

	const columns = [
		indexColumn,
		column('title', 'Title'),
		column('icon', 'Icon'),
		longColumn('description', 'Description'),
		column('sortOrder', 'Order'),
		editColumn({
			data: data.editForm,
			fields,
			title: 'Edit Value',
			keys: ['icon', 'title', 'description', 'sortOrder']
		}),
		deleteColumn(data.deleteForm, 'title')
	];
</script>

<ContentPage
	title="Why Fahem"
	description="The three icon cards in the 'Why Fahem' band on the About page."
	addTitle="Add Value"
	addForm={data.addForm}
	{fields}
	{columns}
	rows={data.rows}
/>
