<script lang="ts">
	interface GalleryImage {
		src: string;
		alt: string;
		caption?: string;
	}

	let { images }: { images: GalleryImage[] } = $props();
</script>

<div class="-mx-4 flex snap-x snap-mandatory gap-4 overflow-x-auto px-4 pb-4 sm:-mx-6 sm:px-6">
	{#each images as image (image.src)}
		<figure
			class="group relative aspect-4/5 w-64 shrink-0 snap-start overflow-hidden rounded-xl border border-border sm:w-72"
		>
			<img
				src={image.src}
				alt={image.alt}
				loading="lazy"
				class="h-full w-full object-cover transition-transform duration-500 group-hover:scale-105"
			/>
			{#if image.caption}
				<figcaption
					class="absolute inset-x-0 bottom-0 bg-gradient-to-t from-black/80 via-black/30 to-transparent p-4 text-sm font-medium text-white"
				>
					{image.caption}
				</figcaption>
			{/if}
		</figure>
	{/each}
</div>
