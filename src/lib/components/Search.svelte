<script>
	import * as Command from '$lib/components/ui/command/index.js';
	import { Disc, Search } from '@lucide/svelte';
	import * as Dialog from '$lib/components/ui/dialog/index.js';
	import { ScrollArea } from '$lib/components/ui/scroll-area/index.js';
	let isOpen = $state(false);
	let list = [
		{ label: 'Dashboard', path: '/dashboard' },
		{ label: 'Messages', path: '/dashboard/messages' },
		{ label: 'Testimonials', path: '/dashboard/testimonials' },

		// Website content
		{ label: 'Page Banners', path: '/dashboard/content/heroes' },
		{ label: 'Gallery Images', path: '/dashboard/content/gallery' },
		{ label: 'Company Milestones', path: '/dashboard/content/milestones' },
		{ label: 'Why Fahem', path: '/dashboard/content/value-props' },
		{ label: 'Farms', path: '/dashboard/content/farms' },
		{ label: 'Farm Sub-regions', path: '/dashboard/content/sub-regions' },
		{ label: 'Coffee Grades', path: '/dashboard/content/coffee-products' },
		{ label: 'Regions & Profiles', path: '/dashboard/content/coffee-regions' },
		{ label: 'Traceability Steps', path: '/dashboard/content/traceability' },
		{ label: 'Partners', path: '/dashboard/content/partners' },
		{ label: 'Ventures', path: '/dashboard/content/ventures' },
		{ label: 'Export Markets', path: '/dashboard/content/export-markets' },
		{ label: 'FAQs', path: '/dashboard/content/faqs' },
		{ label: 'Site Settings', path: '/dashboard/content/settings' },

		// Administration
		{ label: 'Roles', path: '/dashboard/admin-panel/roles' },
		{ label: 'Add Roles', path: '/dashboard/admin-panel/roles/add-roles' },
		{ label: 'Users', path: '/dashboard/admin-panel/users' },
		{ label: 'Add Users', path: '/dashboard/admin-panel/users/add-users' }
	];
</script>

<Dialog.Root bind:open={isOpen}>
	<Dialog.Trigger class="w-auto px-4" title="Search for Pages"><Search /></Dialog.Trigger>
	<Dialog.Content class="w-full">
		<Dialog.Header>
			<Dialog.Title>Search the whole site</Dialog.Title>
		</Dialog.Header>
		<ScrollArea class="h-auto rounded-md border p-2">
			<h5 class="text-center">Search Anything</h5>
			<Command.Root class="rounded-lg shadow-md md:min-w-[450px]">
				<Command.Input placeholder="Type a command or search..." type="search" />
				<Command.List>
					<Command.Empty>No results found.</Command.Empty>
					<Command.Group heading="Suggestions">
						{#each list as item (item.path)}
							<Command.Item>
								<Disc />
								<a href={item.path} onclick={() => (isOpen = false)}>{item.label}</a>
							</Command.Item>
						{/each}
					</Command.Group>
				</Command.List>
			</Command.Root>
		</ScrollArea>
	</Dialog.Content>
</Dialog.Root>
