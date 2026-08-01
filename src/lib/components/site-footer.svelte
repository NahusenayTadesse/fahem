<script lang="ts">
	import { navLinks } from '$lib/nav-links';

	let {
		settings,
		partners = []
	}: {
		settings?: {
			emails?: { label: string; value: string }[] | null;
			phones?: string[] | null;
			footerBlurb?: string | null;
		} | null;
		partners?: { id: number; name: string; websiteUrl?: string | null }[];
	} = $props();

	/** The footer only advertises the first contact of each kind. */
	const email = $derived(settings?.emails?.[0]?.value);
	const phone = $derived(settings?.phones?.[0]);
</script>

<footer class="border-t border-border bg-muted/30">
	<div class="container mx-auto px-4 py-16 sm:px-6">
		<div class="grid gap-12 md:grid-cols-4">
			<div class="md:col-span-2">
				<a href="/" class="flex items-center gap-3">
					<img src="/logo.webp" alt="Fahem General Trading" class="h-16 w-auto dark:invert sm:h-20" />
				</a>
				<p class="mt-4 max-w-sm text-sm text-muted-foreground">{settings?.footerBlurb}</p>
			</div>

			<div>
				<h3 class="text-sm font-semibold tracking-wide text-foreground">Navigate</h3>
				<ul class="mt-4 space-y-2">
					{#each navLinks as link (link.href)}
						<li>
							<a
								href={link.href}
								class="text-sm text-muted-foreground transition-colors hover:text-primary"
							>
								{link.label}
							</a>
						</li>
					{/each}
				</ul>
			</div>

			<div>
				<h3 class="text-sm font-semibold tracking-wide text-foreground">Contact</h3>
				<ul class="mt-4 space-y-2 text-sm text-muted-foreground">
					{#if email}
						<li><a href="mailto:{email}" class="transition-colors hover:text-primary">{email}</a></li>
					{/if}
					{#if phone}
						<li>
							<a href="tel:{phone.replace(/\s/g, '')}" class="transition-colors hover:text-primary">
								{phone}
							</a>
						</li>
					{/if}
				</ul>
			</div>
		</div>

		{#if partners.length}
			<div class="mt-12 border-t border-border pt-8">
				<p
					class="mb-4 text-center text-xs font-medium tracking-wide text-muted-foreground uppercase"
				>
					Trusted Partners
				</p>
				<div class="flex flex-wrap items-center justify-center gap-x-8 gap-y-2">
					{#each partners as partner (partner.id)}
						<a
							href={partner.websiteUrl}
							target="_blank"
							rel="noreferrer noopener"
							class="text-sm text-muted-foreground transition-colors hover:text-primary"
						>
							{partner.name}
						</a>
					{/each}
				</div>
			</div>
		{/if}

		<div
			class="mt-8 flex flex-col items-center justify-between gap-4 border-t border-border pt-8 text-xs text-muted-foreground sm:flex-row"
		>
			<p>Copyright &copy; {new Date().getFullYear()} Fahem General Trading. All rights reserved.</p>
			<a
				href="http://krinfud.com"
				target="_blank"
				rel="noreferrer noopener"
				class="hover:text-primary"
			>
				Developed by Krinfud Digitals
			</a>
		</div>
	</div>
</footer>
