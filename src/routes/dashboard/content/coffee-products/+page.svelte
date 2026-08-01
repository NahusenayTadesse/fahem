<script lang="ts">
	import ContentPage from '$lib/dashboard/content-page.svelte';
	import {
		column,
		deleteColumn,
		editColumn,
		indexColumn
	} from '$lib/dashboard/columns';
	import type { CrudField } from '$lib/components/Table/crud-dialog.svelte';

	let { data } = $props();

	const fields: CrudField[] = [
		{ name: 'name', label: 'Origin', type: 'text', required: true, placeholder: 'e.g. Yirgacheffe' },
		{ name: 'grade', label: 'Grade', type: 'text', placeholder: 'e.g. Grade 2' },
		{ name: 'sortOrder', label: 'Display order', type: 'number' }
	];

	const columns = [
		indexColumn,
		column('name', 'Origin'),
		column('grade', 'Grade'),
		column('sortOrder', 'Order'),
		editColumn({
			data: data.editForm,
			fields,
			title: 'Edit Coffee',
			keys: ['name', 'grade', 'sortOrder']
		}),
		deleteColumn(data.deleteForm, 'name')
	];
</script>

<ContentPage
	title="Coffee Grades"
	description="The origin and grade cards in the Our Coffee section of the home page."
	addTitle="Add Coffee"
	addForm={data.addForm}
	{fields}
	{columns}
	rows={data.rows}
/>
