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
	import { iconNames } from '$lib/components/dynamic-icon.svelte';

	let { data } = $props();

	const iconItems = iconNames.map((name) => ({ value: name, name }));

	const fields: CrudField[] = [
		{ name: 'title', label: 'Venture name', type: 'text', required: true },
		{ name: 'description', label: 'Description', type: 'textarea', rows: 5 },
		{ name: 'image', label: 'Photo', type: 'file' },
		{ name: 'imageAlt', label: 'Image description', type: 'text', placeholder: 'For screen readers' },
		{ name: 'icon', label: 'Icon', type: 'select', items: iconItems },
		{ name: 'regionsServed', label: 'Regions served', type: 'textarea', placeholder: 'One region per line', rows: 4 },
		{ name: 'sortOrder', label: 'Display order', type: 'number' }
	];

	const columns = [
		indexColumn,
		column('title', 'Name'),
		imageColumn('image', 'Photo'),
		longColumn('description', 'Description'),
		listColumn('regionsServed', 'Regions'),
		column('sortOrder', 'Order'),
		editColumn({
			data: data.editForm,
			fields,
			title: 'Edit Venture',
			keys: ['title', 'description', 'imageAlt', 'icon', 'regionsServed', 'sortOrder'],
			fileKeys: ['image'],
			listKeys: ['regionsServed']
		}),
		deleteColumn(data.deleteForm, 'title')
	];
</script>

<ContentPage
	title="Ventures"
	description="The business units listed on the Ventures page."
	addTitle="Add Venture"
	addForm={data.addForm}
	{fields}
	{columns}
	rows={data.rows}
/>
