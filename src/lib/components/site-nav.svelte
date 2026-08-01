<script lang="ts">
	import { page } from '$app/state';
	import { Menu, X } from '@lucide/svelte';
	import ThemeToggle from '$lib/components/theme-toggle.svelte';
	import { navLinks as links } from '$lib/nav-links';

	let open = $state(false);
</script>

<header
	class="sticky top-0 z-50 border-b border-border bg-background/95 backdrop-blur supports-[backdrop-filter]:bg-background/60"
>
	<nav class="container mx-auto flex h-16 items-center justify-between px-4 sm:px-6">
		<a href="/" class="flex items-center gap-2.5">
			<img src="/logo-icon.webp" alt="" class="h-9 w-auto dark:invert sm:h-10" />
			<span class="font-heading text-xl font-bold tracking-tight">
				Fahem <span class="text-primary">General Trading</span>
			</span>
		</a>

		<div class="hidden items-center gap-8 md:flex">
			{#each links as link (link.href)}
				<a
					href={link.href}
					class="text-sm font-medium transition-colors hover:text-primary {page.url.pathname ===
					link.href
						? 'text-primary'
						: 'text-foreground/80'}"
				>
					{link.label}
				</a>
			{/each}
			<ThemeToggle />
		</div>

		<div class="flex items-center gap-1 md:hidden">
			<ThemeToggle />
			<button
				class="p-2 text-foreground"
				aria-label="Toggle menu"
				onclick={() => (open = !open)}
			>
				{#if open}
					<X class="size-6" />
				{:else}
					<Menu class="size-6" />
				{/if}
			</button>
		</div>
	</nav>

	{#if open}
		<div class="border-t border-border bg-background md:hidden">
			<div class="container mx-auto flex flex-col gap-1 px-4 py-3 sm:px-6">
				{#each links as link (link.href)}
					<a
						href={link.href}
						class="rounded-md px-2 py-2 text-sm font-medium transition-colors hover:bg-muted hover:text-primary {page
							.url.pathname === link.href
							? 'text-primary'
							: 'text-foreground/80'}"
						onclick={() => (open = false)}
					>
						{link.label}
					</a>
				{/each}
			</div>
		</div>
	{/if}
</header>
